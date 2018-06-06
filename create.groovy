import groovy.json.JsonSlurper
import parques.*

String base = "https://sib.gob.ar/api/2.0.0/"
String endpoint = "ficha-area-protegida/areas-protegidas"

URL apiUrl = new URL(base + endpoint)

def AreasProtegidas = new JsonSlurper().parse(apiUrl)

AreasProtegidas.each {
    if (it.jurisdiccion == "APN") {
        new AreaProtegida(it).save()
    }
}

return " "
