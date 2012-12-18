package net.kaleidos.pusheame

import grails.converters.JSON

class InstagramController {

	def instagramService

	def map() {
		render view:'/instagram/map'
	}


	def test() {
		// def pictures = instagramService.getPictures()
		// render view:'/instagram/test', model:[pictures:pictures]

		def picture = instagramService.randomPicture()
		event topic:'instagramPicture', data:picture.encodeAsJSON()
	}

	/**
	 * Receive the real-time Instagram notifications
	 */
	def realTime() {
		println "*"*100
		println new Date()
		def photos = request.JSON

		photos.each { photo ->
			// Process the picture
			event topic:'processPicture', data:photo.object_id
			//instagramService.getPictureByGeographic(photo.object_id)
		}

		return render(text:[success:true] as JSON, contentType:'text/json')
	}

	/**
	 * Verify the real-time Instagram subscription
	 */
	def verifyRealTime() {
		// Return only the hub.challenge to confirm the subscription to the real-time API
		render params["hub.challenge"]
	}

}
