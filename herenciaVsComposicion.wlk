// tengo muchas dicmenciones en el personaje
// no tengo que crear una nueva clase por cada combinacion 
// si quiero cambiar un aspecto de un objeto, es su estado interno --> si quiero cambiar el ROL --> hago que ROl sea un atributo
class Personaje {
    const property fuerza 
    const property inteligencia 
    var property rol

    method potencialOfensivo()= 10 * fuerza + rol.potencialOfensivoExtra()  
}
class Humano inherits Personaje {
}
class Orco inherits Personaje {
    override method potencialOfensivo() = super() * 1.1 
}
class Elfo inherits Personaje {
    override method potencialOfensivo() = super() - 10
}

object guerrero {}
object brujo {}
object cazador {}

