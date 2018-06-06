package parques

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/grilla"(controller: "areaProtegida", action: "indexGrilla")

        "/"(uri:"/areaProtegida.index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
