package net.kaleidos.pusheame

import grails.converters.JSON
import com.mongodb.*

class InstagramController {

	def instagramService
	def mongo

	def map() {
		render view:'/instagram/map'
	}

	def wall() {
		render view:'/instagram/wall'
	}

	/**
	 * Verify the real-time Instagram subscription
	 */
	def verifyRealTime() {
		println "Verifying subscription"
		// Return only the hub.challenge to confirm the subscription to the real-time API
		render params["hub.challenge"]
	}

	/**
	 * Receive the real-time Instagram notifications
	 */
	def realTime() {
		println "*"*100
		println new Date()
		def photos = request.JSON

		println photos

		photos.each { photo ->

			if (photo.object == "tag") {

			} else if (photo.object == "geography") {
				// Process the picture
				event topic:'processPicture', data:photo.object_id
				//instagramService.getPictureByGeographic(photo.object_id)				
			}
		}

		return render(text:[success:true] as JSON, contentType:'text/json')
	}



	def test() {
		// def pictures = instagramService.getPictures()
		// render view:'/instagram/test', model:[pictures:pictures]

		def picture = instagramService.randomPicture()
		event topic:'instagramPicture', data:picture.encodeAsJSON()
        event topic:'timeline', data:picture.encodeAsJSON()

    	db.photos.insert(picture)


		// def picture = [url:"http://distilleryimage8.s3.amazonaws.com/2202dbbc48f311e283b822000a9f124c_6.jpg", latitude:63.974079132, longitude:-22.576965332]
		// event topic:'timeline', data:picture.encodeAsJSON()
	}
}
