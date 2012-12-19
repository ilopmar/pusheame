class UrlMappings {

	static mappings = {
		// "/$controller/$action?/$id?"{
		// 	constraints {
		// 		// apply constraints here
		// 	}
		// }

		// Random
		name rndDisplayRandom: "/random-number" { controller = 'random'; action = [GET:'randomNumber'] }
		name rndGenerateRandom: "/random" { controller = 'random'; action = [GET:'random'] }

		// Instagram
		name instgrmMap: "/map" { controller = 'instagram'; action = [GET:'map'] }
		name instgrmWall: "/wall" { controller = 'instagram'; action = [GET:'wall'] }
		name instgrmTest: "/test" { controller = 'instagram'; action = [GET:'test'] }
		name instgrmRealTime: "/instagram-real-time" { controller = 'instagram'; action = [GET:'verifyRealTime', POST:'realTime'] }
	

		"/"(view:"/index")
		"500"(view:'/error')
		"/favicon.ico"(uri:'/favicon.ico')
	}
}
