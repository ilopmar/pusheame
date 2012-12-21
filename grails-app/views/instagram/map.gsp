<html>
<head>
	<meta name='layout' content='main'/>
	<title>Pusheame - Instagram</title>

	<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.4/leaflet.css" />
	<script src="http://cdn.leafletjs.com/leaflet-0.4/leaflet.js"></script>

	<r:require modules="app"/>
	<r:require module="grailsEvents"/>
	
</head>

<body>

	<div id="map"></div>

	<div id="column">
		<div id="logo">
			<g:link uri="/"><img src="${resource(dir: 'images', file: 'pusheame-logo.png')}" alt="Pusheame"/></g:link>
		</div>	

		<div id="timelinePics">
		</div>

		<div id="footer">
			Iván López - <a href="https://twitter.com/ilopmar" target="blank">@ilopmar</a> - 2012
		</div>
	</div>


	<%-- Handlebars timeline template --%>
	<script id="pic-template" type="text/x-handlebars-template">
		<div class="pic" style="visibility:hidden; height:0;">
			<img src="{{url}}">
			<div class="right">
				<p class="user">{{username}}</p>
				<p>{{caption}}</p>
			</div>
		</div>
	</script>

	<r:script>
		var map = L.map('map', {
    		zoomControl: false
		}).setView([40, -108], 4); // Center in USA
		//}).setView([10, 30], 2); // World

		//L.tileLayer('http://a.tile.openstreetmap.org/{z}/{x}/{y}.png', {
		//L.tileLayer('http://{s}.tile.cloudmade.com/cd191a488b7a4c998c9645068f971ce0/1/256/{z}/{x}/{y}.png', {
		L.tileLayer('http://otile2.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.jpg', {
    		maxZoom: 18
		}).addTo(map);
	</r:script>
		

	<r:script>
		// Change the heigth of the timeline
		$('#timelinePics').animate({
			height: $(window).height() - 230
		}, 1000);

		var source = $("#pic-template").html();
		var template = Handlebars.compile(source);

		var photoMarker;
		var smallIcon;

		var grailsEvents = new grails.Events("${createLink(uri:'/', absolute:true)}");

		grailsEvents.on('instagramPicture', function(data) {
			// Resize the big picture to the small icon size
			if (photoMarker) {
				photoMarker.setZIndexOffset(-500);
				photoMarker.setIcon(smallIcon);
			}
			photo = jQuery.parseJSON(data);

			//map.panTo([photo.latitude, photo.longitude]);

			// Append the new object to the timeline
			var context = {
				url: photo.thumbUrl, 
				username: photo.username,
				caption: photo.caption
			}
			var html = template(context);
			$('#timelinePics').prepend(html);

			$("#timelinePics .pic:first-child img").on("load", function() {
				$(this).parent().css({
					display: 'none',
					visibility: 'visible',
					height: 'auto'
				});

				$(this).parent().slideDown();
			});

			// Generate the two icons size
			var bigIcon = L.icon({
    			iconUrl: photo.thumbUrl,
    			iconSize:     [100, 100],
    			iconAnchor:   [50, 50]
			});
			smallIcon = L.icon({
    			iconUrl: photo.thumbUrl,
    			iconSize:     [40, 40],
    			iconAnchor:   [20, 20]
			});
			// Add the big one picture to the map
			photoMarker = L.marker([photo.latitude, photo.longitude], {icon: bigIcon, zIndex:1000}).addTo(map);
		});
	</r:script>

</body>
</html>