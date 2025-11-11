
object estacionEspacial {
  var conocimientoPromedio = 20
  method conocimientoPromedio() = conocimientoPromedio
}

class Tripulante {                                
   var property rol = TipoRolLibre
   var property edad = 0
   var property fuerza = 0
   const property conocimiento = 0
   
 
   method mayorDeEdad() = self.edad() >= 18
   method prestigio()= rol.prestigio()
   method cambiarRol(nuevoRol){
    if (nuevoRol.acepta(self)){
        rol = nuevoRol
    }else {
    throw new DomainException(message = "No cumple requisitos para ese rol")
  }
   }
}

class Rol {
    method condicionCambiar(tripulante) 
    method acepta(tripulante)= tripulante.mayorDeEdad() && self.condicionCambiar(tripulante)
   
}

class TipoRolLibre inherits Rol{

}

class TipoRolObrero inherits Rol{
  method prestigio()=50
  method condicionCambiar(tripulante)= tripulante.fuerza()>50
}

class TipoRolMrFusion inherits Rol{
 method prestigio()=100
 method inteligencia(tripulante)= tripulante.conocimiento()> estacionEspacial.conocimientoPromedio() * 1.21
 method condicionCambiar(tripulante) =  tripulante.inteligencia()
}

class TipoRolCapitan inherits TipoRolMrFusion{
 override method condicionCambiar(tripulante) = tripulante.fuerza()>73 && tripulante.inteligencia()
}
/*
Asumiendo que el objeto “estaciónEspacial” existe y está bien codificado, se pide:
1.Para el código existente, responder verdadero o falso y justificar en todos los casos:

    a)Libre, Obrero y MrFusion deberían ser subclases de Tripulante.

No, libre obrero y mr fusion no deberian ser sub clases de Tipulante ya que de serlo no podriamos cambiar de rol. Al trabajar con herencia esta caracteristica nos afectaria en la identidad de la clase ademas de que como sabemos el concepto de herhencia es como una carta que se juega una vez, sin cambiar.
La solucion que se debe de implementar es utilizando composicion que nos permite cambiar el aspecto osea el estado interno haciendo un atributo de rol

    b)Puede agregarse un rol Capitán sin necesidad de modificar código existente (el rol Capitán es como Mr Fusión, pero además de ser inteligente debe ser fuerte, con fuerza mayor a 73).

falso, para ello deberiamos modificar el method de presigio y podesCambiarA

    c)Puede agregarse el rol Capitán sin necesidad de repetir comportamiento.

falso, vamos a tener que repetir el self de conocimento que tiene el metodo de condicionParMrFusion, esa seria la linea que se repetiria porque creariamos un method nuevo de condicionParaCapitan ()=self.conocimiento() >
        estacionEspacial.conocimientoPromedio() * 1.21 && self.fuerza()>73 que tambien es el mismo self fuerza que hace la concicion de obrero

    d)Suponiendo que en la estación hay varios tripulantes menores de edad. Puedo hacer:
           tripulantes.forEach({ tripulante => tripulante.rolActual(“Obrero”) }
           por c/u de los tripulantes llamame al method rolActual
    Y jamás me enteraría de que hubo un error.

    este for each no me muestra ni hace nada, solo ejecuta la funcion, si hay un tripulante menor de edad el method de mayor de edad ve si es false, si es false entonces las condiciones de los roles tambien y por ende el method de rol actual me tira el return de error

*/