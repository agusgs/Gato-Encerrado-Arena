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
        
        new Button(panelDeLosBotones) => [
            caption = "Salir"
            onClick [ | this.close ]
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
    	//aca ver si no estaria bueno disernir de si no hay items, 
    	//que te abra la pantalla de agarrar elemento
        val accionUsarAppModel = new AccionUsarAppModel()
        accionUsarAppModel.laberinto = modelObject.laberinto
        accionUsarAppModel.habitacion = modelObject.habitacion
        accionUsarAppModel.accionUsar = modelObject.accionUsar
        new AccionUsarWindow(this, accionUsarAppModel).open
    }
}