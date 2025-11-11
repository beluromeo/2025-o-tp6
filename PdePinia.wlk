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
    var fuerza = 10
    var vitalidad = 100
    const resistencia
    var property rango = amateaur

    method ganoUltimaPelea() {
       // código que funciona
    }
    method experiencia() = experiencia
    method intentarPromocionar(){
        rango = rango.promocionarRango(self)
    }
        method pelear(unaConstricante){
            categoria.aplicarReglasPelea(self, unaContrincante)
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


4a) en la primerera version del diagrama, solamente se le asignan clases aisladas a la boxeadora, y dado que no heredan de ninguna super clase estarian repitiendo logica en los methods. a diferecnia de la segunda version la cual posee la supercalse categorias que si bien no se instacia, en ella escribimos el method osea el mensaje que todas estas subclases comparten, Por ende cada una solo reescribiria aquello particular de su clase sin repetir logica y haciendo mas polimorfico el method de pelearContra ya que todas enteinden el mismo mensajje pero de manera ddiferente
ademas en la clase de boxeadora, consultamos sobre el methodo de pelear y no el pelearContra que romperia el encapsulamiento dado que este solamente le debe pertenecer a las categorias de peso

*/

// Esta es la superclase (equivale a ICategoria del diagrama)
// Define el mensaje que todas las categorías deben entender.
class Categoria {
    // Este es el método polimórfico
    method aplicarReglasPelea(boxeadoraPropia, contrincante) {
        // Forza a las subclases a implementar este método
        self.subclassResponsibility()
    }
}

// --- Implementaciones Concretas ---

class PesoPluma inherits Categoria {
    override method aplicarReglasPelea(boxeadoraPropia, contrincante) {
        // "su vitalidad baja a la mitad"
        boxeadoraPropia.vitalidad(boxeadoraPropia.vitalidad() / 2)
        
        // "pero su resistencia aumenta un 80%"
        boxeadoraPropia.resistencia(boxeadoraPropia.resistencia() * 1.80)
    }
}

class PesoLigero inherits Categoria {
    override method aplicarReglasPelea(boxeadoraPropia, contrincante) {
        // "Al pelear, le resta a su contrincante el 10% de la vitalidad"
        contrincante.vitalidad(contrincante.vitalidad() * 0.90)
    }
}

class PesoPesado inherits Categoria {
    var pesoActual

    // Necesita su peso actual para funcionar
    constructor(peso) {
        pesoActual = peso
    }

    override method aplicarReglasPelea(boxeadoraPropia, contrincante) {
        // "Llevan registro de su peso actual" (lo hacemos con el constructor)
        
        if (pesoActual.between(77, 81)) {
            // "deja en 0 la vitalidad de su contrincante si su peso está entre 77 y 81 kilos"
            contrincante.vitalidad(0)
        } else {
            // "Si no, le disminuye la vitalidad en 10 unidades"
            contrincante.vitalidad(contrincante.vitalidad() - 10)
        }

        // "pero su resistencia aumenta en 50 unidades"
        boxeadoraPropia.resistencia(boxeadoraPropia.resistencia() + 50)
    }
}