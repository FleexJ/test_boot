<#--<#assign sf=JspTaglibs["http://www.springframework.org/tags/form"]>-->
<#import "/spring.ftl" as spring/>
<#include "header.ftl"/>

<#macro content>
    <form action="/newUser" method="post">
        <div>
            Name:
            <@spring.formInput "user.name"/>
            <@spring.showErrors ""/>
        </div>
        <div>
            Surname:
            <@spring.formInput "user.surname"/>
            <@spring.showErrors ""/>
        </div>
        <div>
            Email:
            <@spring.formInput "user.email"/>
            <@spring.showErrors ""/>
        </div>
        <div>
            Password:
            <@spring.formPasswordInput "user.password"/>
            <@spring.showErrors ""/>
        </div>
        <input type="submit" value="Ok">
    </form>
</#macro>

<@main title="Add user"/>
