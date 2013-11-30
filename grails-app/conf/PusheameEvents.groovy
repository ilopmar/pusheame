import org.atmosphere.cpr.AtmosphereRequest
import org.grails.plugin.platform.events.EventMessage

def instagramService = ctx.instagramService

events = {
    //'color' browser:true, scope:'*' // allows both server (scope:'app' or 'pluginName') and client (scope:'browser') to send data over this topic
    //'randomNumber' browser:true, scope:'*' // allows browser push on this topic
    'instagramPicture' browser:true
    'processPicture' scope:'*'
    'timeline*' browser:true, scope:'*', browserFilter: { EventMessage msg, AtmosphereRequest request ->
    	println "%"*100
    	println "msg -> ${msg}"
    	println "msg.event -> ${msg.event}"
    	println "msg.data -> ${msg.data}"
    	println "msg.headers -> ${msg.headers}"
    	println "msg.namespace -> ${msg.namespace}"
    	println "msg.gormSession -> ${msg.gormSession}"
    	println "-"*20
    	println request
    	println "%"*100
    	instagramService.someMethod(msg, request)
    }
}