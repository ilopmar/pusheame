<html>
<head>
	<meta name='layout' content='main'/>
	<title>Pusheame - Wall</title>

	<r:require modules="app"/>
	<r:require module="grailsEvents"/>
</head>

<body>

	<div id="header">
		<g:link uri="/"><img src="${resource(dir: 'images', file: 'pusheame-logo.png')}" alt="Pusheame"/></g:link>
	</div>

	<div id="timeline">
	</div>

	<%-- Handlebars timeline template --%>
	<script id="pic-template" type="text/x-handlebars-template">
		<div class="photo" style="visibility:hidden; height:0;">
			<img src="{{url}}" />
		</div>
	</script>
	
	<r:script>
		var source = $("#pic-template").html();
		var template = Handlebars.compile(source);

		var grailsEvents = new grails.Events("${createLink(uri:'/', absolute:true)}");

		grailsEvents.on('timeline', function(data) {
			photo = jQuery.parseJSON(data);

			// Append the new object to the timeline
			var context = {
				url: photo.url
			}
			var html = template(context);
			$('#timeline').prepend(html);

			$("#timeline .photo:first-child img").on("load", function() {
				$(this).parent().css({
					display: 'none',
					visibility: 'visible',
					height: 'auto'
				});

				$(this).parent().slideDown();
			});
		});
	</r:script>
</body>
</html>