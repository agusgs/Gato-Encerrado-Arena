import ar.edu.unq.ciu.GatoEncerradoDominio.AcaHayGatoEncerradoAppModel
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import java.util.ArrayList

class ProovedorDeObjetos {
    def crearAppModel(){
        var appModel = new AcaHayGatoEncerradoAppModel
        appModel.setLaberintos(crearlaberintos())

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
        laberinto.setNombre("Laberinto 1")
        laberinto.setHabitaciones(habitacionesLaberinto1())

        return (laberinto)
    }

    def laberinto2(){
        var laberinto = new Laberinto
        laberinto.setNombre("Laberinto 2")
        laberinto.setHabitaciones(habitacionesLaberinto2())

        return (laberinto)
    }

    def laberinto3(){
        var laberinto = new Laberinto
        laberinto.setNombre("Laberinto 3")
        laberinto.setHabitaciones(habitacionesLaberinto3())

        return (laberinto)
    }

    def habitacionesLaberinto1(){
        var habitaciones = new ArrayList<Habitacion>()

        var hab1 = new Habitacion()
        var hab2 = new Habitacion()
        var hab3 = new Habitacion()

        hab1.setNombre("Habitacion 1")
        hab1.setIsInicial(true)

        hab2.setNombre("Habitacion 2")
        hab2.setIsFinal(true)

        hab3.setNombre("Habitacion 3")

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

        hab1.setNombre("Habitacion 4")
        hab2.setNombre("Habitacion 5")
        hab3.setNombre("Habitacion 6")

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

        hab1.setNombre("Habitacion 7")
        hab2.setNombre("Habitacion 8")
        hab3.setNombre("Habitacion 9")

        habitaciones.add(hab1)
        habitaciones.add(hab2)
        habitaciones.add(hab3)

        return habitaciones
    }
}