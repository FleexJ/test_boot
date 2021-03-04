package com.boot.test.controller;

import com.boot.test.model.User;
import com.boot.test.service.UserService;
import com.boot.test.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {

    private final UserService userService;
    private final UserValidator userValidator;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public MainController(UserService userService, UserValidator userValidator, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.userValidator = userValidator;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String index(@RequestParam(required = false,
            defaultValue = "you",
            value = "name") String name,
                        Model model) {
        model.addAttribute("name", name);
        return "index";
    }

    @GetMapping("/users")
    public String users(Model model) {
        model.addAttribute("users", userService.getUserList());
        return "users";
    }

    @GetMapping("/users/{id}/edit")
    public String editUser(@PathVariable("id") int id,
                           Model model) {
        model.addAttribute("user", userService.getUserById(id));
        return "edit";
    }

    @PostMapping("/users/{id}/edit")
    public String editUserPost(@PathVariable("id") int id,
                               @ModelAttribute User user,
                               BindingResult result) {
        user.setPassword(userService.getUserById(id).getPassword());
        userValidator.validate(user, result);
        if(result.hasErrors())
            return "edit";
        userService.editUser(id, user);
        return "redirect:/users";
    }

    @GetMapping("/newUser")
    public String newUser(Model model) {
        model.addAttribute("user", new User());
        return "newUser";
    }

    @PostMapping("/newUser")
    public String newUserPost(@ModelAttribute User user,
                              BindingResult result) {
        userValidator.validate(user, result);
        if(result.hasErrors())
            return "newUser";
        userService.addUser(user);
        return "redirect:/users";
    }

    @GetMapping("/users/{id}/delete")
    public String deleteUser(@PathVariable("id") int id) {
        userService.deleteUser(id);
        return "redirect:/users";
    }

    @GetMapping("/login")
    public String login(@RequestParam(value = "error", required = false) Boolean error,
                        Model model) {
        if (error != null && error)
            model.addAttribute("error", true);
        return "/login";
    }

    @GetMapping("/users/{id}/changePassword")
    public String changePassword(@PathVariable("id") int id,
                                 Model model) {
        model.addAttribute("user", userService.getUserById(id));
        return "changePassword";
    }
    
    @PostMapping("/users/{id}/changePassword")
    public String changePassword(@PathVariable("id") int id,
                                 @RequestParam("newPassword") String newPassword) {
        if (!newPassword.isEmpty()) {
            User user = userService.getUserById(id);
            user.setPassword(passwordEncoder.encode(newPassword));
            userService.editUser(id, user);
            System.out.println("Пароль для пользователя " + id + " изменен");
        } else
            System.out.println("Пароль для пользователя " + id + " не изменен, так как поле пароля пустое");
        return "redirect:/users";
    }
}
