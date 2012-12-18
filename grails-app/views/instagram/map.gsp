<html>
<head>
	<meta name='layout' content='main'/>
	<title>Pusheame - Instagram</title>

	<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.4/leaflet.css" />
	<!--[if lte IE 8]>
		<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.4/leaflet.ie.css" />
	<![endif]-->

	<link rel="stylesheet" href="${resource(dir: 'css', file: 'app.css')}" type="text/css">

	 <script src="http://cdn.leafletjs.com/leaflet-0.4/leaflet.js"></script>
</head>

<body>

	<div id="map"></div>

	<r:script>
		// var map = L.map('map').setView([51.505, -0.09], 13);
		var map = L.map('map').setView([30, 0], 3);

		L.tileLayer('http://{s}.tile.cloudmade.com/cd191a488b7a4c998c9645068f971ce0/997/256/{z}/{x}/{y}.png', {
    		//attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
    		maxZoom: 18
		}).addTo(map);

		// var marker = L.marker([22.283016667, 114.173061111]).addTo(map);
		// marker.bindPopup("<img src='http://distilleryimage6.s3.amazonaws.com/1ac0c73c3ea411e2aae322000a1f9858_7.jpg' width='100' />"); //.openPopup();
	</r:script>
		

	<r:script>
		var grailsEvents = new grails.Events("${createLink(uri:'/', absolute:true)}");

		grailsEvents.on('instagramPicture', function(data) {
			photo = jQuery.parseJSON(data);

			var popup = L.popup({minWidth:100})
			    .setLatLng([photo.latitude, photo.longitude])
			    .setContent("<img src='" + photo.thumbUrl + "' width='100' />")
			    .openOn(map);
		});
	</r:script>


	<r:require module="grailsEvents"/>
</body>
</html>