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
			<img src="${resource(dir: 'images', file: 'pusheame-logo-small.png')}" alt="Pusheame"/>
		</div>	

		<div id="timelinePics">
			<%--
			<div class="pic">
				<img src="http://distilleryimage6.s3.amazonaws.com/1ac0c73c3ea411e2aae322000a1f9858_7.jpg">
				<div class="right">
					<p class="user">anarochka</p>
					<p>Лапки замерзли ну все равно хочу играться ...</p>
				</div>
			</div>
			--%>
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

		//L.tileLayer('http://{s}.tile.cloudmade.com/cd191a488b7a4c998c9645068f971ce0/997/256/{z}/{x}/{y}.png', {
		//L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
		//L.tileLayer('http://{s}.tile.opencyclemap.org/cycle/{z}/{x}/{y}.png', {

		// Only for USA
		L.tileLayer('http://otile1.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.jpg', {
		//L.tileLayer('http://{s}.tile.cloudmade.com/cd191a488b7a4c998c9645068f971ce0/1/256/{z}/{x}/{y}.png', {
    		maxZoom: 18
		}).addTo(map);

/*
		var popup = L.popup({
			minWidth: 100
		})
    		.setLatLng([40, -108])
    		.setContent("<img src='http://distilleryimage6.s3.amazonaws.com/1ac0c73c3ea411e2aae322000a1f9858_7.jpg' width='100' />")
    		.openOn(map);

		var a = L.marker([50.5, 30.5]).addTo(map);
		a.bindPopup("<img src='http://distilleryimage6.s3.amazonaws.com/1ac0c73c3ea411e2aae322000a1f9858_7.jpg' width='100' />").openPopup();

		var a = L.marker([0.5, -30.5]).addTo(map);
		a.bindPopup("<img src='http://distilleryimage6.s3.amazonaws.com/1ac0c73c3ea411e2aae322000a1f9858_7.jpg' width='100' />"); //.openPopup();
*/
		// var marker = L.marker([22.283016667, 114.173061111]).addTo(map);
		// marker.bindPopup("<img src='http://distilleryimage6.s3.amazonaws.com/1ac0c73c3ea411e2aae322000a1f9858_7.jpg' width='100' />"); //.openPopup();
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
			if (photoMarker) {
				photoMarker.setZIndexOffset(-500);
				photoMarker.setIcon(smallIcon);
			}
			photo = jQuery.parseJSON(data);

			//map.panTo([photo.latitude, photo.longitude]);

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
			photoMarker = L.marker([photo.latitude, photo.longitude], {icon: bigIcon, zIndex:1000}).addTo(map);
		});
	</r:script>

</body>
</html>