import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionMover
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionUsar
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout

class NuevaAccionWindow extends MainWindow<Habitacion>{

    new (Habitacion unaHabitacion) {
        super(unaHabitacion)
    }

    override createContents(Panel mainPanel) {

        this.title = "Agregar accion"

        new Label(mainPanel).text = "Seleccione una accion a agregar"

        this.crearBotones(mainPanel)
    }

    def void crearBotones(Panel parentPanel){

        var panelDeLosBotones = new Panel(parentPanel)
        panelDeLosBotones.setLayout(new HorizontalLayout)

        new Button(panelDeLosBotones) => [
            caption = "Agregar accion de ir a otra habitacion"
            onClick [ | this.crearAccionDeIrAOtraHabitacion() ]
        ]

        new Button(panelDeLosBotones) => [
            caption = "Agregar accion de agarrar un item"
            onClick [ | this.crearAccionDeAgarrarUnItem()]
        ]

        new Button(panelDeLosBotones) => [
            caption = "Agregar accion de usar un elemento"
            onClick [ | this.crearAccionDeUsarUnItem() ]
        ]

    }

    def crearAccionDeIrAOtraHabitacion(){
        val accionMover = new AccionMover()
        this.modelObject.agregarAccionMover(accionMover)
        new AccionMoverWindow(this, accionMover).open
    }

    def crearAccionDeAgarrarUnItem(){
        val accionAgarrar = new AccionAgarrar()
        this.modelObject.agregarAccion(accionAgarrar)
        new AccionAgarrarWindow(this, accionAgarrar).open
    }

    def crearAccionDeUsarUnItem(){
        val accionUsar = new AccionUsar()
        this.modelObject.agregarAccion(accionUsar)
        new AccionUsarWindow(this, accionUsar).open
    }

    def static main(String[] args) {
        new NuevaAccionWindow(new Habitacion()).startApplication
    }

}