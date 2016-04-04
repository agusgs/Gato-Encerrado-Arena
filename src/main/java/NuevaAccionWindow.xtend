import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionMover
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionUsar
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class NuevaAccionWindow extends SimpleWindow<Habitacion>{

    new (WindowOwner parent, Habitacion habitacion) {
        super(parent, habitacion)
    }

    override addActions(Panel actionsPanel) {
        this.crearBotones(actionsPanel)
    }

    override createFormPanel(Panel mainPanel) {
        this.title = "Agregar accion"

        new Label(mainPanel).text = "Seleccione una accion a agregar"
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
}