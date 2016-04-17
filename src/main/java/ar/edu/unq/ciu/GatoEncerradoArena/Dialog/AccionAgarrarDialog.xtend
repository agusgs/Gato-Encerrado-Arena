package ar.edu.unq.ciu.GatoEncerradoArena.Dialog

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import ar.edu.unq.ciu.GatoEncerradoAppModel.AccionAgarrarAppModel

class AccionAgarrarWindow extends Dialog<AccionAgarrarAppModel>{

    new (WindowOwner owner, AccionAgarrarAppModel accion) {
        super(owner, accion)
    }

    override createFormPanel(Panel mainPanel) {
    	this.title = "Agregar acciòn de Agarrar un elemento"

		var panelDeLabel = new Panel(mainPanel)
       	panelDeLabel.setLayout(new VerticalLayout)

		new Label(mainPanel).text = "Escriba el elemento que aparecerá en la habitación"
		new TextBox(mainPanel).bindValueToProperty("nombreNuevoItem")

		new Button(mainPanel) => [
			caption = "Cancelar"
			onClick [ | close ]
		]
		
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [ | 
				modelObject.agregarAccion()
				close
			]
		]
   	}
}