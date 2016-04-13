
import ar.edu.unq.ciu.GatoEncerradoDominio.AcaHayGatoEncerradoAppModel
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.TextBox

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.unq.ciu.GatoEncerradoAppModel.AgregarAccionAppModel

class PantallaPrincipalWindow extends SimpleWindow<AcaHayGatoEncerradoAppModel>{

    new (WindowOwner parent, AcaHayGatoEncerradoAppModel model) {
        super(parent, model)
    }

    override addActions(Panel actionsPanel) {
    }

    override createFormPanel(Panel mainPanel) {

        var panelDelTitulo = new Panel(mainPanel)

        var panelDelContenido = new Panel(mainPanel)
        panelDelContenido.setLayout(new HorizontalLayout)

        var panelLaberintos = new Panel(panelDelContenido)
        var panelHabitaciones = new Panel(panelDelContenido)
        var panelHabitacionSeleccionada = new Panel(panelDelContenido)

        armarPanelTitulo(panelDelTitulo)
        armarPanelLaberintos(panelLaberintos)
        armarPanelHabitaciones(panelHabitaciones)
        armarPanelHabitacionSeleccionada(panelHabitacionSeleccionada)
    }

    def armarPanelTitulo(Panel panelPadre){
        new Label(panelPadre).text = "Aca Hay Gato Encerrado"
    }

    def armarPanelLaberintos(Panel panelPadre){

        new Label(panelPadre).text = "Laberintos"

        var tablaLaberintos = new Table<Laberinto>(panelPadre, typeof(Laberinto)) => [

            bindItemsToProperty("laberintos")
            bindValueToProperty("laberintoSeleccionado")
        ]

        new Column<Laberinto>(tablaLaberintos) => [
            title = "Nombre del laberinto"
            bindContentsToProperty("nombre")
        ]

        var panelBotonesLaberintos = new Panel(panelPadre)
        armarBotonesLaberintos(panelBotonesLaberintos)
    }

    def armarPanelHabitaciones(Panel panelPadre){

        var panelTitulo = new Panel(panelPadre)
        panelTitulo.setLayout(new HorizontalLayout)

        new Label(panelTitulo).text = "Habitacion de: "
        new Label(panelTitulo).bindValueToProperty("laberintoSeleccionado.nombre")

        new Label(panelPadre).text = "Nombre Laberinto"
        new TextBox(panelPadre).bindValueToProperty("laberintoSeleccionado.nombre")

        var tablaHabitaciones = new Table<Habitacion>(panelPadre, typeof(Habitacion)) => [

            bindItemsToProperty("laberintoSeleccionado.habitaciones")
            bindValueToProperty("habitacionSeleccionada")
        ]

        new Column<Habitacion>(tablaHabitaciones) => [
            title = "Nombre de la habitacion"
            bindContentsToProperty("nombre")
        ]

        var panelBotonesHabitaciones = new Panel(panelPadre)
        armarBotonesHabitaciones(panelBotonesHabitaciones)
    }

    def armarPanelHabitacionSeleccionada(Panel panelPadre){

        var panelTitulo = new Panel(panelPadre)
        panelTitulo.setLayout(new HorizontalLayout)

        new Label(panelTitulo).text = "Habitacion seleccionada: "
        new Label(panelTitulo).bindValueToProperty("habitacionSeleccionada.nombre")

        new Label(panelPadre).text = "Nombre"
        new TextBox(panelPadre).bindValueToProperty("habitacionSeleccionada.nombre")

        var panelEsInicial = new Panel(panelPadre)
        panelEsInicial.setLayout(new HorizontalLayout)

        var checkEsInicial = new CheckBox(panelEsInicial)
        checkEsInicial.bindValueToProperty("habitacionSeleccionada.isInicial")

        new Label(panelEsInicial).text = "Es Inicial?"


        var panelEsFinal = new Panel(panelPadre)
        panelEsFinal.setLayout(new HorizontalLayout)

        var checkEsFinal = new CheckBox(panelEsFinal)
        checkEsFinal.bindValueToProperty("habitacionSeleccionada.isFinal")

        new Label(panelEsFinal).text = "Es Final?"


        var tablaAcciones = new Table<Accion>(panelPadre, typeof(Accion)) => [

            bindItemsToProperty("habitacionSeleccionada.acciones")
            bindValueToProperty("accionSeleccionada")
        ]

        new Column<Accion>(tablaAcciones) => [
            title = "Acciones"
            bindContentsToProperty("nombre")
        ]

        var panelBotonesHabitacionSeleccionada = new Panel(panelPadre)
        armarBotonesHabitacionSeleccionada(panelBotonesHabitacionSeleccionada)
    }

    def armarBotonesLaberintos(Panel panelPadre){
        new Button(panelPadre) => [
            caption = "Agregar Laberinto"
            onClick [ | this.agregarLaberinto() ]
        ]

        new Button(panelPadre) => [
            caption = "Quitar Laberinto"
            onClick [ | this.quitarLaberinto()]
        ]
    }

    def armarBotonesHabitaciones(Panel panelPadre){
        new Button(panelPadre) => [
            caption = "Agregar Habitacion"
            onClick [ | this.agregarHabitacion() ]
        ]

        new Button(panelPadre) => [
            caption = "Quitar Habitacion"
            onClick [ | this.quitarHabitacion()]
        ]
    }

    def armarBotonesHabitacionSeleccionada(Panel panelPadre){

        new Button(panelPadre) => [
            caption = "Agregar Accion"
            onClick [ | this.agregarAccion() ]
        ]

        new Button(panelPadre) => [
            caption = "Quitar Accion"
            onClick [ | this.quitarAccion()]
        ]
    }

    def agregarHabitacion(){
        new HabitacionNuevaDialog(this, this.modelObject).open
    }

    def quitarHabitacion(){
        new HabitacionQuitarDialog(this, this.modelObject).open
    }

    def agregarLaberinto(){
        new LaberintoNuevoDIalog(this, this.modelObject).open
    }

    def quitarLaberinto(){
        new LaberintoQuitarDialog(this, this.modelObject).open
    }

    def agregarAccion(){
        var agregarAccionAppModel = new AgregarAccionAppModel()
        agregarAccionAppModel.laberinto = modelObject.laberintoSeleccionado
        agregarAccionAppModel.habitacion = modelObject.habitacionSeleccionada

        new NuevaAccionWindow(this, agregarAccionAppModel).open
    }

    def quitarAccion(){
        new QuitarAccionDialog(this, modelObject)
    }
}