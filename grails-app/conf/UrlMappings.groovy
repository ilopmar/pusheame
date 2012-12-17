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
		name instgrmTest: "/instagram-test" { controller = 'instagram'; action = [GET:'test'] }

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
