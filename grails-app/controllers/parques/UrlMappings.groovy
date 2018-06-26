package parques

class UrlMappings {

    static mappings = {

        // FUCK CONVENTIONS
        //"/$controller/$action?/$slug?(.$format)?"{}

        // Parte publica
        "/"(uri: "/areas-protegidas/")
        group "/areas-protegidas", {
            get "/"(controller: "areaProtegida", action: "index", namespace: "publico")
            get "/$slug"(controller: "areaProtegida", action: "show", namespace: "publico")
            post "/$slug/especies"(controller: "especie", action: "index", namespace: "publico")
        }

        group "/api", {
            get "/clases"(controller: "helper", action: "getClases")
            get "/ordenes"(controller: "helper", action: "getOrdenes")
            get "/familias"(controller: "helper", action: "getFamilias")
            get "/generos"(controller: "helper", action: "getGeneros")
        }

        // Login
        get "/login/auth"(controller: "login", action: "auth")
        post "/logout"(controller: "logout")
        get "/login/authfail"(controller: "login", action: "authfail")

        //Parte privada
        group "/admin", {
            get "/"(controller: "areaProtegida", action: "index", namespace: "privado")
            group "/areas-protegidas", {
                get "/mostrar/$slug"(controller: "areaProtegida", action: "show", namespace: "privado")
                get "/nueva"(controller: "areaProtegida", action: "create", namespace: "privado")
                get "/editar/$slug"(controller: "areaProtegida", action: "edit", namespace: "privado")
                post "/guardar/$ap"(controller: "areaProtegida", action: "save", namespace: "privado")
                put "/actualizar/$ap"(controller: "areaProtegida", action: "update", namespace: "privado")
                delete "/eliminar/$id"(controller: "areaProtegida", action: "delete", namespace: "privado")
                post "/cargarDatos"(controller: "areaProtegida", action: "cargarDatos", namespace: "privado")
            }
        }

        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
