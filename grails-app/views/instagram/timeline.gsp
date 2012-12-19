<html>
<head>
	<meta name='layout' content='main'/>
	<title>Pusheame - Instagram</title>

	<link rel="stylesheet" href="${resource(dir: 'css', file: 'app.css')}" type="text/css">
</head>

<body>

	<div id="timeline">
		
<!-- 		<div class="photo">
			<img src="http://distilleryimage4.s3.amazonaws.com/b66e1b74490011e2a73f22000a9e28ad_6.jpg"/>
		</div>

		<div class="photo">
			<img src="http://distilleryimage4.s3.amazonaws.com/b66e1b74490011e2a73f22000a9e28ad_6.jpg" />
		</div>

		<div class="photo">
			<img src="http://distilleryimage4.s3.amazonaws.com/b66e1b74490011e2a73f22000a9e28ad_6.jpg" />
		</div>

		<div class="photo">
			<img src="http://distilleryimage4.s3.amazonaws.com/b66e1b74490011e2a73f22000a9e28ad_6.jpg" />
		</div>

		<div class="photo">
			<img src="http://distilleryimage4.s3.amazonaws.com/b66e1b74490011e2a73f22000a9e28ad_6.jpg" />
		</div>

		<div class="photo">
			<img src="http://distilleryimage4.s3.amazonaws.com/b66e1b74490011e2a73f22000a9e28ad_6.jpg" />
		</div>

		<div class="photo">
			<img src="http://distilleryimage4.s3.amazonaws.com/b66e1b74490011e2a73f22000a9e28ad_6.jpg" />
		</div>

		<div class="photo">
			<img src="http://distilleryimage4.s3.amazonaws.com/b66e1b74490011e2a73f22000a9e28ad_6.jpg" />
		</div>

		<div class="photo">
			<img src="http://distilleryimage4.s3.amazonaws.com/b66e1b74490011e2a73f22000a9e28ad_6.jpg" />
		</div>

		<div class="photo">
			<img src="http://distilleryimage8.s3.amazonaws.com/2202dbbc48f311e283b822000a9f124c_6.jpg" />
		</div> -->

	</div>
	

	<r:script>
		var grailsEvents = new grails.Events("${createLink(uri:'/', absolute:true)}");

		grailsEvents.on('timeline', function(data) {
			photo = jQuery.parseJSON(data);

			var img = $("<img>").attr("src", photo.url);
			var div = $("<div>").addClass("photo").append(img);

			$('#timeline').prepend(div);
		});
	</r:script>


	<r:require module="grailsEvents"/>
</body>
</html>