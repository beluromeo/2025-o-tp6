class Aventurero {
  var property vida 
  var cantAniosServicio 
  var defensa
  var equipamiento = [new Espada()]
  var cantPlus
  // con property haria el method vida = vida y el de vida (nuevaVida){vida = nuevaVida}
  // aca no uso property porque no quiero que me cambien mi vida los demas -> encapsulamiento
  method recibirDanio(danio) {
    vida -= danio - defensa
  }
  method fuerzaAtaque() = self.danioEquipamiento() + self.plus()
  
  method plus() = cantPlus* cantAniosServicio
  //danio total que hacen todos los equipamientos q tiene el aventurero -> sum
  method danioEquipamiento() = equipamiento.sum({ eq => eq.danio() })
  // x c/u de los elementos eq del equipamiento, dame el danio
  //vida - (ataque - defensa)
  method atacar(contrincante) {
    //lamo al metodo de fuerzaAtgaque de el que esta atacanodo
    contrincante.recibirDanio(self.fuerzaAtaque())
    //aca le mando mensjae al contricante de ataqe
  }
  
}

const unGuerrero = new Aventurero(
  vida = 1000, 
  cantAniosServicio = 10, 
  defensa = 50, 
  cantPlus = 100
  )


class Mago inherits Aventurero {
  const companiero 

  override method atacar(contrincante){
    companiero.atacar(contrincante)
  }

}

class Clerigo inherits Aventurero (cantPlus = 50) {
  
  override method recibirDanio(danio) {
    super(danio)
    vida += 5
  }
}

class Equipamiento {
  var property desgaste = 0
  method danio() = 100 - desgaste
}

class Espada inherits Equipamiento {
  method afilar() {
    desgaste = 0
  }
}

object armadura {
  method danio() = 0
}

class BastonComun inherits Equipamiento {
  override method danio() = 10
}

