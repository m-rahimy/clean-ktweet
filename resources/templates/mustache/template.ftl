<#-- @ftlvariable name="user" type="pojo.User" -->

<#macro mainLayout title="Welcome">
    <!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>${title} | Kweet</title>
        <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
        <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">
        <link rel="stylesheet" type="text/css" href="/styles/main.css">
    </head>
    <body>
    <div class="pure-g">
        <div class="sidebar pure-u-1 pure-u-md-1-4">
            <div class="header">
                <div class="brand-title">Kweet</div>
                <nav class="nav">
                    <ul class="nav-list">
                        <li class="nav-item"><a class="pure-button" href="/">homepage</a></li>
                        <#if user??>
                            <li class="nav-item"><a class="pure-button" href="/user/${user.userId}">my timeline</a></li>
                            <li class="nav-item"><a class="pure-button" href="/post-new">New kweet</a></li>
                            <li class="nav-item"><a class="pure-button" href="/logout">sign out
                                    [${user.name?has_content?then(user.name, user.userID)}]</a></li>
                        <#else>
                            <li class="nav-item"><a class="pure-button" href="/register">sign up</a></li>
                            <li class="nav-item"><a class="pure-button" href="/login">sign in</a></li>
                        </#if>
                    </ul>
                </nav>
            </div>
        </div>

        <div class="content pure-u-1 pure-u-md-3-4">
            <h2>${title}</h2>
            <#nested />
        </div>
        <div class="footer">
            Kweet ktor example, ${.now?string("yyyy")}
        </div>
    </div>
    </body>
    </html>
</#macro>

<#macro kweet_li kweet>
<#-- @ftlvariable name="kweet" type="pojo.Kweet" -->
    <section class="post">
        <header class="post-header">
            <p class="post-meta">
                <a href="/kweet/${kweet.id}">${kweet.date.toDate()?string("yyyy.MM.dd HH:mm:ss")}</a>
                by <a href="/user/${kweet.user}">${kweet.user}</a></p>
        </header>
        <div class="post-description">${kweet.content}</div>
    </section>
</#macro>

<#macro kweets_list kweets>
    <ul>
        <#list kweets as kweet>
            <@kweet_li kweet=kweet></@kweet_li>
        <#else>
            <li>There are no kweets yet</li>
        </#list>
    </ul>
</#macro>