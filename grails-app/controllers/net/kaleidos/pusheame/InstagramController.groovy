package net.kaleidos.pusheame

import grails.converters.JSON

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
		def picture = instagramService.randomPicture()
		event topic:'instagramPicture', data:picture.encodeAsJSON()
        event topic:'timeline', data:picture.encodeAsJSON()
	}
}
