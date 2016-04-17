package ar.edu.unq.ciu.GatoEncerradoArena.Dialog

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.PropertyAdapter

//import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

import ar.edu.unq.ciu.GatoEncerradoDominio.Accion
import ar.edu.unq.ciu.GatoEncerradoAppModel.AgregarAccionAppModel
import ar.edu.unq.ciu.GatoEncerradoAppModel.AccionUsarAppModel
import ar.edu.unq.ciu.GatoEncerradoArena.Ordenar.NuevaAccionWindow

class AccionUsarWindow extends Dialog<AccionUsarAppModel>{

    new (WindowOwner owner, AccionUsarAppModel model) {
        super(owner, model)
    }

    override createFormPanel(Panel mainPanel) {

        this.title = "Agregar accion de Usar un elemento"

        mainPanel.setLayout(new VerticalLayout)
        new Label(mainPanel).text = "Selecciones el elemento que puede ser usado"

        new Selector<Accion>(mainPanel) => [
        	allowNull(false)
        	items.bindToProperty("habitacion.acciones").adapter = new PropertyAdapter(Accion, "nombre")
            value.bindToProperty("accionSeleccionada")
        	//onSelection(Action):
		]

		new Label(mainPanel).text = "Crear la accion a realizar"

		new Button(mainPanel) => [
			caption = "Agregar Acciòn"
			//enabled => false
			onClick [ |
				new NuevaAccionWindow(this, crearNuevaApp).open
			]
		]
		//new Label(mainPanel).[]

		this.crearBotones(mainPanel)
    }

    def void crearBotones(Panel mainPanel){
		var panelDeLosBotones = new Panel(mainPanel)
       	panelDeLosBotones.setLayout(new HorizontalLayout)
			new Button(mainPanel) => [
			caption = "Cancelar"
			onClick [ | this.close ]
		]

		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [ |  ]
		]
   	}

   	def crearNuevaApp(){
   		val app = new AgregarAccionAppModel()
   		app.setLaberinto(this.modelObject.laberinto)
   		app.setHabitacion(this.modelObject.habitacion)
   		app
   	}
}