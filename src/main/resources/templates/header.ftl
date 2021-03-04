<#macro main title>
    <!DOCTYPE html>
    <html lange="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>${title}</title>
    </head>

    <body>
    <@content/>
    <#if title != "Index page">
        <hr/>
        <a href="/">На главную</a>
    </#if>
    </body>
    </html>
</#macro>