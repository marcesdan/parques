package parques

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "500"(view:'/error')
        "404"(view:'/notFound')

        /*Parte publica*/
        "/"(uri: "areas-protegidas")
        "/areas-protegidas"(controller: "publicoArea", action: "index")
        get "/area-protegida/$id"(controller: "publicoArea", action: "show")

        /*Parte privada*/
        "/admin"(controller: "areaProtegida", action: "index")
    }
}
