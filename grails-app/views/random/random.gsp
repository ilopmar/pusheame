<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
	</head>
	<body>

		<div id="randomNumbers">
		</div>


		<div id="send" style="width:50px; height:50px; background-color:red;">
		</div>

		        
		<r:require module="grailsEvents"/>

		<r:script>
			var grailsEvents = new grails.Events("${createLink(uri:'/', absolute:true)}");

			grailsEvents.on('randomNumber', function(data) {
				$("#randomNumbers").append("<p>" + data + "</p>");
			});

			$('#send').on("click", function(event) {
				event.preventDefault();

				console.log("Antes");
				//grailsEvents.send('color', "HOLA");
				grailsEvents.send('randomNumber', 3);
				console.log("Después");
			});
		</r:script>
 

	</body>
</html>
