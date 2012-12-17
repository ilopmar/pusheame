<html>
<head>
	<meta name='layout' content='main'/>
	<title>Pusheame - Instagram</title>
</head>

<body>
	<div class="center">
		<g:each in="${pictures}" var="picture">
			<p>${picture.url}</p>
			<p>${picture.latitude}</p>
			<p>${picture.longitude}</p>
			<br/><br/>
		</g:each>
		
	</div>

	

</body>
</html>