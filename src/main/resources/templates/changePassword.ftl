<#include "header.ftl"/>

<#macro content>
    <form action="/users/${user.getId()}/changePassword" method="post">
        New password:
        <input type="password" name="newPassword"/>
        <br/>
        <input type="submit" value="Ok"/>
    </form>
</#macro>

<@main title="Change password"/>