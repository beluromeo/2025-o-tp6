class Boxeadora {
    var fuerza 
    var vitabilidad
    var resistencia
     var experiencia
method sumarExperiencia(cantidad){
    experiencia += cantidad
}
    //cuando se que gano una pelea?

}

class Rango {
    var experiencia
    var rango = Rango
    method sumarExperiencia(boxeadora, ganoPela){}
    method disputarPeleas(boxeadora) {}
   
  
    method cambiarRango(){
        if (boxeadora.experiencia() > 100){
            rango = new Profesional
        } else if (rango == 'Profesional'){
            rango = new Campeona
        }
    }
}

class Amateur inherits Rango{
    override method sumarExperiencia(boxeadora, ganoPela){
        boxeadora.sumarExperiencia(10)
    }
    override method disputarPeleas(boxeadora) = {return false}
}

class Profesional inherits Rango{
    override method sumarExperiencia() {
        experiencia += 100
    }
    override method disputarPeleas(boxeadora) = boxeadora.experiencia > 131416  
}
class Campeona inherits Rango {

}
// que otros objetos modifique n mi estado interno