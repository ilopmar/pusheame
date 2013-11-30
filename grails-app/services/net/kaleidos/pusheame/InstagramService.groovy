package net.kaleidos.pusheame

import groovy.json.JsonSlurper

class InstagramService {

	static transactional = false

	def mongo

	Random random = new Random()

	def clientId = "15caef3eae0245c382291b28d0485831"

	def pictures = [
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage1.s3.amazonaws.com/d18c4ca4483911e29d8c22000a1fbd8b_7.jpg", url:"http://distilleryimage1.s3.amazonaws.com/d18c4ca4483911e29d8c22000a1fbd8b_7.jpg", latitude:63.974079132 as Double, longitude:-22.576965332 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage8.s3.amazonaws.com/12d89e2e483511e2ace922000a1f90f6_7.jpg", url:"http://distilleryimage8.s3.amazonaws.com/12d89e2e483511e2ace922000a1f90f6_7.jpg", latitude:48.866475499 as Double, longitude:2.350620338 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage7.s3.amazonaws.com/f9f0623c483b11e2900e22000a1f96c7_7.jpg", url:"http://distilleryimage7.s3.amazonaws.com/f9f0623c483b11e2900e22000a1f96c7_7.jpg", latitude:14.642080307 as Double, longitude:121.037803649 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage7.s3.amazonaws.com/db24bde0483a11e29e0522000a1fa50c_7.jpg", url:"http://distilleryimage7.s3.amazonaws.com/db24bde0483a11e29e0522000a1fa50c_7.jpg", latitude:13.745900735 as Double, longitude:100.535358315 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage8.s3.amazonaws.com/8c3f48cc484311e29c6822000a1f9688_7.jpg", url:"http://distilleryimage8.s3.amazonaws.com/8c3f48cc484311e29c6822000a1f9688_7.jpg", latitude:13.76815319 as Double, longitude:100.567634582 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage9.s3.amazonaws.com/0c73548a483e11e2b83422000a1f9e4c_7.jpg", url:"http://distilleryimage9.s3.amazonaws.com/0c73548a483e11e2b83422000a1f9e4c_7.jpg", latitude:13.667921984 as Double, longitude:100.457830693 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage9.s3.amazonaws.com/9c8b4e50483011e286b422000a9d0dd8_7.jpg", url:"http://distilleryimage9.s3.amazonaws.com/9c8b4e50483011e286b422000a9d0dd8_7.jpg", latitude:-12.107051993 as Double, longitude:-76.974320679 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage0.s3.amazonaws.com/36bdd8e4484011e2ac5022000a9f18b3_7.jpg", url:"http://distilleryimage0.s3.amazonaws.com/36bdd8e4484011e2ac5022000a9f18b3_7.jpg", latitude:22.283016667 as Double, longitude:114.173061111 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage3.s3.amazonaws.com/43e80586485311e2974222000a1fbdac_5.jpg", url:"http://distilleryimage3.s3.amazonaws.com/43e80586485311e2974222000a1fbdac_5.jpg", latitude:40.730948977 as Double, longitude:-73.974979785 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage10.s3.amazonaws.com/055a474e484811e2b5c422000a1f9a53_5.jpg", url:"http://distilleryimage10.s3.amazonaws.com/055a474e484811e2b5c422000a1f9a53_5.jpg", latitude:-23.585132598 as Double, longitude:-46.689842224 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage10.s3.amazonaws.com/31da4f14484b11e2bb3522000a1fb076_5.jpg", url:"http://distilleryimage10.s3.amazonaws.com/31da4f14484b11e2bb3522000a1fb076_5.jpg", latitude:51.501407104 as Double, longitude:-2.546291136 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage6.s3.amazonaws.com/a2d20328484711e2bd6322000a1fa42a_5.jpg", url:"http://distilleryimage6.s3.amazonaws.com/a2d20328484711e2bd6322000a1fa42a_5.jpg", latitude:-6.371333333 as Double, longitude:106.890333333 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage2.s3.amazonaws.com/4d1433a6484d11e2a61a22000a9e06f0_5.jpg", url:"http://distilleryimage2.s3.amazonaws.com/4d1433a6484d11e2a61a22000a9e06f0_5.jpg", latitude:13.724960813 as Double, longitude:100.535094738 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage6.s3.amazonaws.com/a7746606485011e2aeda22000a1f973b_5.jpg", url:"http://distilleryimage6.s3.amazonaws.com/a7746606485011e2aeda22000a1f973b_5.jpg", latitude:51.772697448 as Double, longitude:-1.429522156 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage4.s3.amazonaws.com/efc99f18485311e2a86422000a1f9839_5.jpg", url:"http://distilleryimage4.s3.amazonaws.com/efc99f18485311e2a86422000a1f9839_5.jpg", latitude:38.903333333 as Double, longitude:-77.061833333 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage2.s3.amazonaws.com/0fe1e300484a11e2ac5022000a9f18b3_5.jpg", url:"http://distilleryimage2.s3.amazonaws.com/0fe1e300484a11e2ac5022000a9f18b3_5.jpg", latitude:48.885036412 as Double, longitude:2.324883318 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage2.s3.amazonaws.com/23439116484d11e28df322000a1f9367_5.jpg", url:"http://distilleryimage2.s3.amazonaws.com/23439116484d11e28df322000a1f9367_5.jpg", latitude:48.862197875 as Double, longitude:2.299952507 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage2.s3.amazonaws.com/82767a92485511e2b0c122000a9f17df_5.jpg", url:"http://distilleryimage2.s3.amazonaws.com/82767a92485511e2b0c122000a9f17df_5.jpg", latitude:14.649191856 as Double, longitude:121.04837799 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage8.s3.amazonaws.com/5f2acc48485311e2901122000a9f1939_5.jpg", url:"http://distilleryimage8.s3.amazonaws.com/5f2acc48485311e2901122000a9f1939_5.jpg", latitude:-21.211000442 as Double, longitude:-50.438667297 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage4.s3.amazonaws.com/efc99f18485311e2a86422000a1f9839_5.jpg", url:"http://distilleryimage4.s3.amazonaws.com/efc99f18485311e2a86422000a1f9839_5.jpg", latitude:38.903333333 as Double, longitude:-77.061833333 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage4.s3.amazonaws.com/a0e286fc484f11e291f422000a1fbd6e_5.jpg", url:"http://distilleryimage4.s3.amazonaws.com/a0e286fc484f11e291f422000a1fbd6e_5.jpg", latitude:13.639354705 as Double, longitude:100.645126342 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage6.s3.amazonaws.com/7c1b9884484c11e28b2322000a1fbe1b_5.jpg", url:"http://distilleryimage6.s3.amazonaws.com/7c1b9884484c11e28b2322000a1fbe1b_5.jpg", latitude:13.856845216 as Double, longitude:100.661960756 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage2.s3.amazonaws.com/23439116484d11e28df322000a1f9367_5.jpg", url:"http://distilleryimage2.s3.amazonaws.com/23439116484d11e28df322000a1f9367_5.jpg", latitude:48.862197875 as Double, longitude:2.299952507 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage9.s3.amazonaws.com/895e0b2e484e11e28a2c22000a9f15d9_5.jpg", url:"http://distilleryimage9.s3.amazonaws.com/895e0b2e484e11e28a2c22000a9f15d9_5.jpg", latitude:-22.983909064 as Double, longitude:-43.209854781 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage2.s3.amazonaws.com/d477c076485011e29d7122000a1f97c6_5.jpg", url:"http://distilleryimage2.s3.amazonaws.com/d477c076485011e29d7122000a1f97c6_5.jpg", latitude:14.532927168 as Double, longitude:120.981896152 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage5.s3.amazonaws.com/f51b08b4484c11e2b59422000a9f13f8_5.jpg", url:"http://distilleryimage5.s3.amazonaws.com/f51b08b4484c11e2b59422000a9f13f8_5.jpg", latitude:38.58017722 as Double, longitude:-121.49377 as Double],
		[username:"Iván", caption:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", thumbUrl:"http://distilleryimage5.s3.amazonaws.com/2f51cd8e485611e2a2e022000a1faf45_5.jpg", url:"http://distilleryimage5.s3.amazonaws.com/2f51cd8e485611e2a2e022000a1faf45_5.jpg", latitude:51.515046578 as Double, longitude:-0.09734202 as Double]
	]

	public randomPicture() {
		def size = pictures.size()
		return pictures[random.nextInt(size-1)]
	}

	/**
	 * Process a real-time geographic update. Get the picture and push it to the browser
	 *
	 * @objectId The id of the geographic location
	 *
	 */
	@grails.events.Listener(topic = 'processPicture')
	public getPictureByGeographic(String objectId) {
		def url = "https://api.instagram.com/v1/geographies/${objectId}/media/recent?client_id=${clientId}&count=1"
		def content = new URL(url).getText("UTF-8")
		def slurper = new JsonSlurper()
		def response = slurper.parseText(content)

		def db = mongo.getDB("pusheame")

		response.data.each { instagramPic ->
			def picture = [:]

			picture.instagramId = instagramPic.id
			picture.title = instagramPic.caption?.text
			picture.url = instagramPic.images.standard_resolution.url
			picture.thumbUrl = instagramPic.images.thumbnail.url
			picture.author = instagramPic.caption?.from?.username
            picture.latitude = instagramPic.location?.latitude
            picture.longitude = instagramPic.location?.longitude
            picture.username = instagramPic.user?.username
            picture.caption = instagramPic.caption?.text

            // Push the photo to the timeline
            event topic:'timeline', data:picture.encodeAsJSON()

            if (instagramPic.location) {
            	// Push the photo to the map
            	event topic:'instagramPicture', data:picture.encodeAsJSON()

            	// Change the BigDecimal to Float
				instagramPic.location.longitude = instagramPic.location.longitude as Double
				instagramPic.location.latitude = instagramPic.location.latitude as Double
            }

        	db.photos.insert(instagramPic)
		}
	}

	public someMethod() {
		println "POR AQUI "*100
		return true
	}

}