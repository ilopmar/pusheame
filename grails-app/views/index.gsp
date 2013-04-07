<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Pusheame</title>

		<r:require modules="app"/>
	</head>
	<body>

		<div id="header">
			<g:link uri="/">
				<img src="${resource(dir: 'images', file: 'pusheame-logo.png')}" alt="Pusheame"/>
			</g:link>
		</div>
		<div id="main">
			<h1>Welcome to Pusheame</h1>
			<p>
				Pusheame is a proof-of-concept of the 
				<a href="http://grails.org/plugin/platform-core" target="blank">platform-core</a> and 
				<a href="http://grails.org/plugin/events-push" target="blank">events-push</a> Grails plugins.
				The application has been developed during the 3rd <a href="http://kaleidos.net/" target="blank">Kaleidos</a> 
				<a href="http://piweek.es/" target="blank">PiWeek</a>.
			</p>
			<p>
				The goal of the application is get geolocalized pictures from Instagram Real-Time API and display them in a map
				also in real-time. In addition, you can enjoy a wall full of the received pictures.
			</p>

			<div>
				<ul>
					<li>
						<g:link mapping="instgrmMap">Map</g:link>
					</li>
					<li>
						<g:link mapping="instgrmWall">Wall</g:link>
					</li>
				</ul>
			</div>

            <p>
                If you click in the previous links and nothing happens it can be due the application has reached to the maximum number of calls to the Instagram API.
                Please come back later and try again or watch the video to see how is the demo.
            </p>

			<div class="source">
				<p>
					The source code of this project is at my github account: 
					<a href="https://github.com/lmivan/pusheame">https://github.com/lmivan/pusheame</a>
				</p>
				<p>Follow me on twitter: <a href="https://twitter.com/ilopmar">@ilopmar</a></p>
			</div>

			<div>
				<iframe src="http://player.vimeo.com/video/56363238?title=0&amp;byline=0&amp;portrait=0" width="500" height="375" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe> <p><a href="http://vimeo.com/56363238">Pusheame: Instagram Real-Time pictures</a> from <a href="http://vimeo.com/ilopmar">Iv&aacute;n L&oacute;pez</a> on <a href="http://vimeo.com">Vimeo</a>.</p>
			</div>

		</div>
	</body>
</html>
