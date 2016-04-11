import ar.edu.unq.ciu.GatoEncerradoDominio.AcaHayGatoEncerradoAppModel
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import java.util.ArrayList

class ProovedorDeObjetos {
    def crearAppModel(){
        var appModel = new AcaHayGatoEncerradoAppModel
        appModel.laberintos = crearlaberintos()

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
}