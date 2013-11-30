package net.kaleidos.pusheame

import grails.converters.JSON
import groovy.json.JsonSlurper

class InstagramController {

	def instagramService

	/**
	 * Render map view
	 */
	def map() {
		render view:'/instagram/map'
	}

	/**
	 * Render wall view
	 */
	def wall() {
		render view:'/instagram/wall'
	}

	/**
	 * Verify the real-time Instagram subscription
	 */
	def verifyRealTime() {
		println "Verifying Instagram Real-time subscription"
		// Return only the hub.challenge to confirm the subscription to the real-time API
		render params["hub.challenge"]
	}

	/**
	 * Receive the real-time Instagram notifications
	 */
	def realTime() {
		println "Received a new update..."
		println new Date()

		def photos = request.JSON
		photos.each { photo ->
			if (photo.object == "geography") {
				// Process the picture
				event topic:'processPicture', data:photo.object_id
				//instagramService.getPictureByGeographic(photo.object_id)
			}
		}

		return render(text:[success:true] as JSON, contentType:'text/json')
	}



	def test() {
		//def picture = instagramService.randomPicture()
		//event topic:'instagramPicture', data:picture.encodeAsJSON()
        //event topic:"timeline_${new Date()}", data:picture.encodeAsJSON()

//		def data = [username:"Iván", thumbUrl:"http://distilleryimage1.s3.amazonaws.com/d18c4ca4483911e29d8c22000a1fbd8b_7.jpg", url:"http://distilleryimage1.s3.amazonaws.com/d18c4ca4483911e29d8c22000a1fbd8b_7.jpg"]

		while (true) {
        def url = "http://www.flightradar24.com/zones/full_all.json"

		def content = new URL(url).getText("UTF-8")
		def slurper = new JsonSlurper()
		def response = slurper.parseText(content)

		// def list = []
		response.each { flight ->
		     if (!['ts', 'full_count', 'version'].contains(flight.key)) {
		     	if (flight.key == 'AWE269') {
			     	def data = [username:"Iván", thumbUrl:"http://distilleryimage1.s3.amazonaws.com/d18c4ca4483911e29d8c22000a1fbd8b_7.jpg", url:"http://distilleryimage1.s3.amazonaws.com/d18c4ca4483911e29d8c22000a1fbd8b_7.jpg"]
			     	data.caption = flight.key
			     	data.latitude = flight.value[1]
			     	data.longitude = flight.value[2]

			     	event topic:'instagramPicture', data:data.encodeAsJSON()
		     	}
		     }
		 }
		}
		//         println flight.key
		//         println flight.value[1]
		//         println flight.value[2]
		//     }
		//     // println flight.value.each { values ->
		//     //     println values
		//     // }
		// }
	}
}
