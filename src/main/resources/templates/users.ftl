<#include "header.ftl"/>

<#macro content>
    <#if users?has_content>
        <table cellpadding="5px">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Surname</th>
                <th>Email</th>
            </tr>
            <#list users as user>
                <tr>
                    <td>${user.getId()}</td>
                    <td>${user.getName()}</td>
                    <td>${user.getSurname()}</td>
                    <td>${user.getEmail()}</td>
                    <td>
                        <a href="/users/${user.getId()}/edit">Редактировать</a>
                    </td>
                    <td>
                        <a href="/users/${user.getId()}/changePassword">Изменить пароль</a>
                    </td>
                    <td>
                        <a href="/users/${user.getId()}/delete">Удалить</a>
                    </td>
                </tr>
            </#list>
        </table>
    <#else>
        <p>Пользователей пока нет</p>
    </#if>
    <hr/>
    <a href="/logout">Logout</a>
</#macro>

<@main title="All users"/>
