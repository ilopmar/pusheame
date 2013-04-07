<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Welcome to Pusheame</title>
    </head>
    <body>
        <div id="header">
            <g:link uri="/">
                <img src="${resource(dir: 'images', file: 'pusheame-logo.png')}" alt="Pusheame"/>
            </g:link>
        </div>
        <div id="main">
            <h1>There was an error</h1>

            <p>As this is a simple proof-of-concept demo and I have not changed anything, this error is probably due to Cloudfoundry.
                Please come back later to see if the application is back-up again.
            </p>
        </div>

        <g:if env="development">
            <g:renderException exception="${exception}" />
        </g:if>
    </body>
</html>
