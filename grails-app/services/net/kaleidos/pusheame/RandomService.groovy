package net.kaleidos.pusheame

class RandomService {

	//@grails.events.Listener(topic = 'color', namespace = 'browser')
	//public color(String num) {
	@grails.events.Listener(topic = 'randomNumber', namespace = 'browser')
	public color(Integer num) {
		println "*"*100
		println num

		event topic:'randomNumber', data:num

	}

}