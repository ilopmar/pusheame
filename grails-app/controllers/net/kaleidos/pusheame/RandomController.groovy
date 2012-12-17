package net.kaleidos.pusheame

class RandomController {

	Random random = new Random()

	def randomNumber() {
		// 10.times {
		// 	Object.sleep random.nextInt(900) + 100
		// 	event topic:'randomNumber', data:random.nextInt(1000)
		// }
		
		event topic:'randomNumber', data:random.nextInt(1000)

		render "hola"
	}

	def random() {
		render view:'/random/random'
	}
}