package ar.edu.unq.ciu.GatoEncerradoArena.Dialog

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import ar.edu.unq.ciu.GatoEncerradoDominio.Item
import ar.edu.unq.ciu.GatoEncerradoAppModel.AccionAgarrarAppModel
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import ar.edu.unq.ciu.GatoEncerradoDominio.Accion

class AccionAgarrarWindow extends Dialog<AccionAgarrarAppModel>{

    new (WindowOwner owner, AccionAgarrarAppModel accion) {
        super(owner, accion)
    }

    override createFormPanel(Panel mainPanel) {
    	this.title = "Agregar acciòn de Agarrar un elemento"

		var panelDeLabel = new Panel(mainPanel)
       	panelDeLabel.setLayout(new VerticalLayout)
       	
		new Label(mainPanel).text = "Escriba el elemento que aparecerà en la habitaciòn"
		val item = new Item
		item.setNombre = new TextBox(mainPanel).value.toString

			new Button(mainPanel) => [
			caption = "Cancelar"
			onClick [ | this.close ]
		]
		
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [ | 
				this.modelObject.habitacion.agregarAccion(nuevaAccion(item))
				this.close
			]
		]
   	}
	def Accion nuevaAccion(Item item){
		val accion = new AccionAgarrar()
		accion.setItem(item)
		accion
	}
}