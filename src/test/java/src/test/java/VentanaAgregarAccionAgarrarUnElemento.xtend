package src.test.java

import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.Item
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class VentanaAgregarAccionAgarrarUnElemento extends SimpleWindow<Habitacion>{

	new(WindowOwner parent, Habitacion model) {
		super(parent, model)
	}
	
	override createContents(Panel mainPanel) {
			this.title = "Agregar accion de Agarrar un elemento"
			mainPanel.layout = new VerticalLayout
			
			new Label(mainPanel).text = "Escriba una habitacion a la cual ir"
			
			val nombreItem = new TextBox(mainPanel).value.toString
			val Item item = new Item
			item.setNombre(nombreItem) 
			
			new Button(mainPanel) => [
				caption = "Cancelar"
				onClick [ | this.close ]
			]
			
			new Button(mainPanel) => [
				caption = "Aceptar"
				onClick [ | this.modelObject.agregarAccion(new AccionAgarrar(item)) ]
			]
			
		}
	
	override protected addActions(Panel actionsPanel) {
	}
	
	override protected createFormPanel(Panel mainPanel) {
	}
	
}