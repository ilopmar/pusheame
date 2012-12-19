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
				Pusheame is a proof-of-concept of the following Grails plugins 
				<a href="http://grails.org/plugin/platform-core" target="blank">platform-core</a> and 
				<a href="http://grails.org/plugin/events-push" target="blank">events-push</a> developed during 
				the 3rd <a href="http://kaleidos.net/" target="blank">Kaleidos</a> 
				<a href="http://piweek.es/" target="blank">PiWeek</a>.
			</p>
			<p>
				The goal of the application is get geolocalized pictures from Instagram Real-Time API and display them in a map
				in real time.
				Also, a wall with all the pictures received is available.
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
				The source code of this project is at my github account

		</div>
	</body>
</html>
