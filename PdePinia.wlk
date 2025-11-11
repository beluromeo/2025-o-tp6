class Rango {
 method experienciaPorPelea(ganoPelea) = 10
 method puedePelearPorTitulo(boxeadora) = false
 method promocionarRango(boxeadora) {return self}
}

object amateaur inherits Rango {

    override method promocionarRango(boxeadora) {
       if (boxeadora.experiencia()> 100){
        return profesional
       } else {
        return self
       }
    }
}
object profesional inherits Rango {

  override method experienciaPorPelea(boxeadora) {
         if (boxeadora.ganoUltimaPelea() == false)  {
           return 50
         } else {
           return 100
         }
    }
  override method puedePelearPorTitulo(boxeadora) = boxeadora.experiencia() > 131416

  override method promocionarRango(boxeadora) {return campeona}

}

object campeona inherits Rango {
  override method experienciaPorPelea(boxeadora) = 20
  override method puedePelearPorTitulo(boxeadora) = true
}

class Gimnasio {
    const boxeadoras = []
    method boxeadoras() = boxeadoras
    method reevaluarRangoDeBoxeadoras() {
        // el gim le dice a cada boxeadora q intente promocionar -Z forEach 
        boxeadoras.forEach({boxeadora => boxeadora.intentarPromocionar()})
    }
    
   
}
class Boxeadora {
    const apodo
    var experiencia = 0
    const fuerza
    const vitalidad
    const resistencia
    var property rango = amateaur

    method ganoUltimaPelea() {
       // código que funciona
    }
    method experiencia() = experiencia
    method intentarPromocionar(){
        rango = rango.promocionarRango(self)
    }
}


// que otros objetos modifique n mi estado interno

/*
A) falso, no hay encapsulamiento y en la linea donde esta el methodod de proporcionarRango dentro de la clase Gimnasio, vemos que esta clase quiere modificar o alterar consultando sobre valores que no le pertences sino que si son solamente de Boxeadora
osea quiere modificar el estado interno de la boxeadora
b) falso, justsmenten en el if else dentro del methodo de proporcionar rango es la deficnicion de NO usar poli
deberia haber un method en rangos. no esta tratando indistitntamebte, sino que esta distinguiendo una por una con el if
c) falso, porque tendria que haber una excepecion que una boxeadora sea campeona? justamente es una condicion normal y esperada del prograa
si la boxeadora es de rango campeona, se queda ahi, no asiende de ranfo nada mas

*/