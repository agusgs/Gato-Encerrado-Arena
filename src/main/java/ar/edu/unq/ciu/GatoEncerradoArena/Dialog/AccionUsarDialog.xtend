package ar.edu.unq.ciu.GatoEncerradoArena.Dialog

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.aop.windows.TransactionalWindow

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.PropertyAdapter

//import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import ar.edu.unq.ciu.GatoEncerradoDominio.Item
import ar.edu.unq.ciu.GatoEncerradoAppModel.AgregarAccionAppModel
import ar.edu.unq.ciu.GatoEncerradoAppModel.AccionUsarAppModel
import ar.edu.unq.ciu.GatoEncerradoArena.Ordenar.NuevaAccionWindow

class AccionUsarWindow extends TransactionalWindow<AccionUsarAppModel>{

    new (WindowOwner owner, AccionUsarAppModel model) {
        super(owner, model)
    }

    override createFormPanel(Panel mainPanel) {

        this.title = "Agregar accion de Usar un elemento"

        mainPanel.setLayout(new VerticalLayout)
        new Label(mainPanel).text = "Selecciones el elemento que puede ser usado"

        new Selector<Item>(mainPanel) => [
        	allowNull(false)
        	items.bindToProperty("habitacion.items").adapter = new PropertyAdapter(Accion, "nombre")
            value.bindToProperty("itemSeleccionado")
		]

        new Label(mainPanel).text = "Agregar acción"

        new Button(mainPanel) => [
            caption = "Agregar acción"
            onClick [ | new NuevaAccionWindow(this, crearAccion).open ]
        ]

		this.crearBotones(mainPanel)
    }

    def void crearBotones(Panel mainPanel){
		var panelDeLosBotones = new Panel(mainPanel)
       	panelDeLosBotones.setLayout(new HorizontalLayout)

        new Button(mainPanel) => [
            caption = "Aceptar"
            onClick [ | close]
        ]

        new Button(mainPanel) => [
			caption = "Cancelar"
			onClick [ | close ]
		]
    }

   	def crearAccion(){
   		val agregarAccionAppModel = new AgregarAccionAppModel()
   		agregarAccionAppModel.setLaberinto(this.modelObject.laberinto)
   		agregarAccionAppModel.setHabitacion(this.modelObject.habitacion)
   		agregarAccionAppModel
   	}

    override addActions(Panel actionsPanel) {
    }

}