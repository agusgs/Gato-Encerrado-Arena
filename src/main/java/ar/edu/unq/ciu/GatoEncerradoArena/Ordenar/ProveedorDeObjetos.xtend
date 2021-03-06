package ar.edu.unq.ciu.GatoEncerradoArena.Ordenar

import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.GatoEncerradoDominio.Login
import ar.edu.unq.ciu.GatoEncerradoDominio.Usuario
import java.util.ArrayList
import ar.edu.unq.ciu.GatoEncerradoAppModel.AcaHayGatoEncerradoAppModel

class ProveedorDeObjetos {
    def crearAppModel(){
        var appModel = new AcaHayGatoEncerradoAppModel
        appModel.usuario.laberintos = crearlaberintos()

        return appModel
    }

    def crearlaberintos(){
        var laberintos = new ArrayList<Laberinto>()
        laberintos.add(laberinto1())
        laberintos.add(laberinto2())
        laberintos.add(laberinto3())

        return laberintos
    }

    def laberinto1(){
        var laberinto = new Laberinto
        laberinto.nombre = "Laberinto 1"
        laberinto.habitaciones = habitacionesLaberinto1()

        return (laberinto)
    }

    def laberinto2(){
        var laberinto = new Laberinto
        laberinto.nombre = "Laberinto 2"
        laberinto.habitaciones = habitacionesLaberinto2()

        return (laberinto)
    }

    def laberinto3(){
        var laberinto = new Laberinto
        laberinto.nombre = "Laberinto 3"
        laberinto.habitaciones = habitacionesLaberinto3()

        return (laberinto)
    }

    def habitacionesLaberinto1(){
        var habitaciones = new ArrayList<Habitacion>()

        var hab1 = new Habitacion()
        var hab2 = new Habitacion()
        var hab3 = new Habitacion()

        hab1.nombre = "Habitacion 1"
        hab1.isInicial = true

        hab2.nombre = "Habitacion 2"
        hab2.isFinal = true

        hab3.nombre = "Habitacion 3"

        habitaciones.add(hab1)
        habitaciones.add(hab2)
        habitaciones.add(hab3)

        return habitaciones
    }

    def habitacionesLaberinto2(){
        var habitaciones = new ArrayList<Habitacion>()

        var hab1 = new Habitacion()
        var hab2 = new Habitacion()
        var hab3 = new Habitacion()

        hab1.nombre = "Habitacion 4"
        hab2.nombre = "Habitacion 5"
        hab3.nombre = "Habitacion 6"

        habitaciones.add(hab1)
        habitaciones.add(hab2)
        habitaciones.add(hab3)

        return habitaciones
    }

    def habitacionesLaberinto3(){
        var habitaciones = new ArrayList<Habitacion>()

        var hab1 = new Habitacion()
        var hab2 = new Habitacion()
        var hab3 = new Habitacion()

        hab1.nombre = "Habitacion 7"
        hab2.nombre = "Habitacion 8"
        hab3.nombre = "Habitacion 9"

        habitaciones.add(hab1)
        habitaciones.add(hab2)
        habitaciones.add(hab3)

        return habitaciones
    }

    def nuevoLogin(){
        var login = new Login
        login.usuarios = tresUsuarios
        return login
    }

    def tresUsuarios(){
        var usuario1 = new Usuario
        var usuario2 = new Usuario
        var usuario3 = new Usuario

        usuario1.nombre = "gise"
        usuario2.nombre = "tefi"
        usuario3.nombre = "pablo"
        usuario3.nombre = "nacho"

        usuario1.password = "gise"
        usuario2.password = "tefi"
        usuario3.password = "pablo"
        usuario3.password = "nacho"

        return newArrayList(usuario1, usuario2, usuario3)
    }
}