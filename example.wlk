class Aventurero {
  var vida 
  var cantAniosServicio 
  var defensa
  var equipamiento = [new Espada()]
  
  // con property haria el method vida = vida y el de vida (nuevaVida){vida = nuevaVida}
  // aca no uso property porque no quiero que me cambien mi vida los demas -> encapsulamiento
  method fuerzaAtaque() {
    self.danioEquipamiento() + self.plus()
  }
  
  method plus() = 100 * cantAniosServicio
  
  //danio total que hacen todos los equipamientos q tiene el aventurero -> sum
  method danioEquipamiento() = equipamiento.sum({ eq => eq.danio() })
  
  // x c/u de los elementos eq del equipamiento, dame el danio
  //vida - (ataque - defensa)
  method atacar(contrincante) {
    //lamo al metodo de fuerzaAtgaque de el que esta atacanodo
    contrincante.recibirAtaque(self.fuerzaAtaque())
    //aca le mando mensjae al contricante de ataqe
  }
  
  method recibirDanio(danio) {
    vida -= danio - defensa
  }
}

class Guerrero inherits Aventurero (vida = 1000, cantAniosServicio = 10) {
  
}

class Equipamiento {
  var desgaste = 0
  
  method danio() = 100 - desgaste
}

class Espada inherits Equipamiento {
  method adilar() {
    desgaste = 0
  }
}

object armadura {
  method danio() = 0
}

class BastonComun {
  method danio() = 10
}