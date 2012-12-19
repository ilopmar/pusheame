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
		<div class="pic">
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

		//L.tileLayer('http://{s}.tile.cloudmade.com/cd191a488b7a4c998c9645068f971ce0/997/256/{z}/{x}/{y}.png', {
		//L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
		//L.tileLayer('http://{s}.tile.opencyclemap.org/cycle/{z}/{x}/{y}.png', {

		// Para sólo EEUU mola
		L.tileLayer('http://otile1.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.jpg', {
		//L.tileLayer('http://{s}.tile.cloudmade.com/cd191a488b7a4c998c9645068f971ce0/1/256/{z}/{x}/{y}.png', {
    		//attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
    		maxZoom: 18
		}).addTo(map);

		var a = L.marker([50.5, 30.5]).addTo(map);
		a.bindPopup("<img src='http://distilleryimage6.s3.amazonaws.com/1ac0c73c3ea411e2aae322000a1f9858_7.jpg' width='100' />"); //.openPopup();

		var a = L.marker([0.5, -30.5]).addTo(map);
		a.bindPopup("<img src='http://distilleryimage6.s3.amazonaws.com/1ac0c73c3ea411e2aae322000a1f9858_7.jpg' width='100' />"); //.openPopup();

		// var marker = L.marker([22.283016667, 114.173061111]).addTo(map);
		// marker.bindPopup("<img src='http://distilleryimage6.s3.amazonaws.com/1ac0c73c3ea411e2aae322000a1f9858_7.jpg' width='100' />"); //.openPopup();
	</r:script>
		

	<r:script>
		var source = $("#pic-template").html();
		var template = Handlebars.compile(source);

		var grailsEvents = new grails.Events("${createLink(uri:'/', absolute:true)}");

		grailsEvents.on('instagramPicture', function(data) {
			photo = jQuery.parseJSON(data);

			//map.panTo([photo.latitude, photo.longitude]);

			var context = {
				url: photo.thumbUrl, 
				username: photo.username,
				caption: photo.caption
			}
			var html = template(context);
			$('#timelinePics').prepend(html);

			var popup = L.popup({minWidth:100})
			    .setLatLng([photo.latitude, photo.longitude])
			    .setContent("<img src='" + photo.thumbUrl + "' width='100' />")
			    .openOn(map);
		});
	</r:script>

</body>
</html>