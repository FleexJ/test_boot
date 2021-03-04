<#include "header.ftl"/>

<#macro content>
    <h2>Hello, ${name}</h2>
    <hr/>
    <a href="/users">Users</a>
    <hr/>
    <a href="/newUser">Registration</a>
</#macro>

<@main title="Index page"/>
