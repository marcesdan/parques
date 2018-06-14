package parques

class UrlMappings {

    static mappings = {

        // FUCK CONVENTIONS
        //"/$controller/$action?/$id?(.$format)?"{}

        // Parte publica
        "/"(uri: "/area-protegida/")
        group "/area-protegida", {
            get "/"(controller: "areaProtegida", action: "index", namespace: "publico")
            get "/$id"(controller: "areaProtegida", action: "show", namespace: "publico")
            get "/especies/$id"(controller: "areaProtegida", action: "showEspecies", namespace: "publico")
        }

        // Login
        get "/login/auth"(controller: "login", action: "auth")
        post "/logout"(controller: "logout")
        get "/login/authfail"(controller: "login", action: "authfail")

        //Parte privada
        group "/admin", {
            get "/"(controller: "areaProtegida", action: "index")
            group "/area", {
                get "/mostrar/$id"(controller: "areaProtegida", action: "show")
                get "/nueva"(controller: "areaProtegida", action: "create")
                get "/editar/$id"(controller: "areaProtegida", action: "edit")
                post "/guardar/$id"(controller: "areaProtegida", action: "save")
                put "/actualizar/$id"(controller: "areaProtegida", action: "update")
                delete "/eliminar/$id"(controller: "areaProtegida", action: "delete")
                post "/cargarDatos"(controller: "areaProtegida", action: "cargarDatos")
            }
        }

        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
