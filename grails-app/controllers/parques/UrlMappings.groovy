package parques

class UrlMappings {

    static mappings = {

        // FUCK CONVENTIONS
        //"/$controller/$action?/$slug?(.$format)?"{}

        // Parte publica
        get "/"(uri: "/areas-protegidas/")
        group "/areas-protegidas", {
            get "/"(controller: "areaProtegida", action: "index", namespace: "publico")
            get "/filtrar"(controller: "areaProtegida", action: "filtrar", namespace: "publico")
            get "/$slug"(controller: "areaProtegida", action: "show", namespace: "publico")
            post "/$slug/especies"(controller: "especie", action: "index", namespace: "publico")
        }

        group "/api", {
            get "/areasProtegidas"(controller: "areaProtegida", action: "index", namespace: "publico")
            get "/clases"(controller: "helper", action: "getClases")
            get "/ordenes"(controller: "helper", action: "getOrdenes")
            get "/familias"(controller: "helper", action: "getFamilias")
            get "/generos"(controller: "helper", action: "getGeneros")
            get "/especiesPorNombreCientifico"(controller: "helper", action: "getEspeciesPorNombreCientifico")
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
                post "/guardar"(controller: "areaProtegida", action: "save", namespace: "privado")
                put "/actualizar"(controller: "areaProtegida", action: "update", namespace: "privado")
                delete "/eliminar/$id"(controller: "areaProtegida", action: "delete", namespace: "privado")
                post "/cargarDatos"(controller: "areaProtegida", action: "cargarDatos", namespace: "privado")
                post "/agregarEspecies/$id"(controller: "areaProtegida", action:"agregarEspecies", namespace: "privado")
                //post "/quitarEspecie/$id"(controller: "areaProtegida", action:"agregarEspecies", namespace: "privado")
            }
            group "/especies", {
                get "/nueva"(controller: "especie", action: "create", namespace: "privado")
                get "/editar/$nombre_cientifico"(controller: "especie", action: "edit", namespace: "privado")
                post "/guardar"(controller: "especie", action: "save", namespace: "privado")
                put "/actualizar"(controller: "especie", action: "update", namespace: "privado")
                delete "/eliminar/$id"(controller: "especie", action: "delete", namespace: "privado")
            }
        }

        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
