//code smell el if que hay preguntando el estado
//el tripulante tipo hace todo, no tiene que saber las reglas de rol --> delegar
// no tiene wque hacer el tripulante la pregunta de "rol, soso obrero? entonces prestiguio 50"
// tendira que preguntar "rol, cual es tu prestiguio?"

//entonces creo mi ROL -> van a tener en comun prestigio y si los acepto
// si los acepta el rol seria condicionDeCadaTipo + lo de la edad

//aca no puedo hacer como en baston 
/*
class Baston inherits Equipamiento {
  var cantUsos = 0
  //cambia mi tipo -> cambia mi objeto
  var tipo = new TipoComun()
  method usar(){
    cantUsos += 1
    if (cantUsos ==3){
    tipo = new TipoClava(cantClavos =2)
    } else if (cantUsos==8){
      tipo = new TipoMaza(kgPeso = 1)
    }
  }
}
Porque ahi el tigger es interno y tipo automatico, en cambio aca el tirgger es manual y externo. El usuario inta hacer el cambio de rol, en el otro cambiaba dependiendo cuanto usaba las cosas osea automatico.
el "Si se intenta cambiar de rol por uno que no se puede, se considera un error" ya me dice que voy a tener un method de CAMBIAR ROL
*/

class Rol {
    method prestigio()
    method aceptarTripulante(tripulante) = tripulante.mayorDeEsas() && self.condicionDeEseRol(tripulante)
    method condicionDeEseRol(tripulante)
}

class TipoRolLibre inherits Rol{
    override method prestigio()=0
    override method aceptarTripulante(tripulante)= tripulante
    override method condicionDeEseRol(tripulante) = true
}

class TipoRolObrero inherits Rol{
    override method prestigio()=50
    override method condicionDeEseRol(tripulante)= tripulante.fuerza()>50
}

class TipoRolMrFusion inherits Rol {
    override method prestigio()=100
    override method condicionDeEseRol(tripulante) = self.esInteligente(tripulante)
    method esInteligente(tripulante) = tripulante.conocimiento() > estacionEspacial.conocimientoPromedio() * 1.21
}
class TipoRolCapitan inherits TipoRolMrFusion {
    override method condicionDeEseRol(tripulante) = tripulante.fuerza()>73 && self.esInteligente(tripulante)
}
object estacionEspacial {
  var conocimientoPromedio = 20
  method conocimientoPromedio() = conocimientoPromedio
}

//ahora mi tripulante no sabe q tine q hacer ->
class Tripulante {
   var property rol = TipoRolLibre
   var property edad = 0
   var property fuerza = 0
   const property conocimiento = 0

   method mayorDeEdad() = self.edad() >= 18
   //mis tipos de roles entienden el mensaje de prestigio 
   method prestigio()= rol.prestigio()

    method cambiarRol(nuevoRol){
    if (nuevoRol.acepta(self)){
        rol = nuevoRol
    }else {
    throw new DomainException(message = "No cumple requisitos para ese rol")
  }
   }
}

//
// ------------------------ CALENDARIO ------------------------------
//
class Calendario {
  var property eventos = []
  // la fecha esta libre si TODOS los eventos me dan False a ocparFecha

  method estaLibre(fecha){
    return eventos.all({evento => not evento.ocupaFecha(fecha)})
  }
}
class Evento{ 
    method ocupaFecha(unaFecha)
}

class DiaCompleto inherits Evento {
    var fecha
    override method ocupaFecha(unaFecha) {
        //ocupa la fecha si es igual a la suya
        return fecha == unaFecha
    }
}

class Recordatorio inherits Evento {
   override method ocupaFecha(unaFecha){return false}
}
class EventoVariosDias inherits Evento {
    var property fechas = []
    override method ocupaFecha(unaFecha) {
        // ocupa la fecha si esta en su lista?
        return fechas.contains(unaFecha)
    }
}



/*
a)Es necesario agregar una superclase Evento para que los distintos tipos de eventos sean polimórficos.
falso, el method de eta libre le mnada el mensaje a ambas clases de si es recordatorio --> las dos saben q contestarle. el polimorfimso se basa en q los onjetos compartan un "tipo" osea mismo mensaje, no q hereden de la misma subclase

b)Es posible agregar un nuevo tipo de evento: los de varios días (en ellos se detalla una lista con todos los días que ocupa), sin cambiar el código de la clase calendario.
falso, se tendria que modificar la linea del method de esta libre ya que esa si rompe el polimorfismo
*/
