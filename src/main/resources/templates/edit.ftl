<#--<#assign sf=JspTaglibs["http://www.springframework.org/tags/form"]>-->
<#import "/spring.ftl" as spring/>
<#include "header.ftl"/>

<#macro content>
    <form action="/users/${user.getId()}/edit" method="post">
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
        <input type="submit" value="Ok">
    </form>
</#macro>

<@main title="Edit user"/>
