package ar.edu.unq.ciu.GatoEncerradoArena.Ordenar

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.ciu.GatoEncerradoAppModel.MoverAppModel
import ar.edu.unq.ciu.GatoEncerradoAppModel.AgregarAccionAppModel
import ar.edu.unq.ciu.GatoEncerradoArena.Dialog.AccionMoverDialog
import ar.edu.unq.ciu.GatoEncerradoAppModel.AccionUsarAppModel
import ar.edu.unq.ciu.GatoEncerradoAppModel.AccionAgarrarAppModel
import ar.edu.unq.ciu.GatoEncerradoArena.Dialog.AccionAgarrarWindow
import ar.edu.unq.ciu.GatoEncerradoArena.Dialog.AccionUsarWindow

class NuevaAccionWindow extends SimpleWindow<AgregarAccionAppModel>{

    new (WindowOwner parent, AgregarAccionAppModel model) {
        super(parent, model)
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
        val moverAppModel = new MoverAppModel()
        moverAppModel.habitaciones = modelObject.laberinto.habitaciones
        moverAppModel.habitacionActual = modelObject.habitacion
        moverAppModel.habitacionSeleccionada = moverAppModel.habitaciones.get(0)  
        new AccionMoverDialog(this, moverAppModel).open
    }

    def crearAccionDeAgarrarUnItem(){
        val accionAgarrar = new AccionAgarrarAppModel()
        accionAgarrar.habitacion = this.modelObject.habitacion
        new AccionAgarrarWindow(this, accionAgarrar).open
    }

    def crearAccionDeUsarUnItem(){
        val accionUsarAppModel = new AccionUsarAppModel()
        accionUsarAppModel.laberinto = this.modelObject.laberinto
        accionUsarAppModel.habitacionActual = this.modelObject.habitacion
        new AccionUsarWindow(this, accionUsarAppModel).open
    }
}