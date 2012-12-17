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


}
