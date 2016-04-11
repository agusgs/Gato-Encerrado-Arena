import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import ar.edu.unq.ciu.GatoEncerradoDominio.Item

class AccionAgarrarWindow extends Dialog<AccionAgarrar>{

    new (WindowOwner owner, AccionAgarrar accion) {
        super(owner, accion)
    }

    override createFormPanel(Panel mainPanel) {
    	this.title = "Agregar acciòn de Agarrar un elemento"

		var panelDeLabel = new Panel(mainPanel)
       	panelDeLabel.setLayout(new VerticalLayout)
       	
		new Label(mainPanel).text = "Escriba una habitaciòn a la cual ir"
		val item = new Item
		item.setNombre = new TextBox(mainPanel).value.toString

			new Button(mainPanel) => [
			caption = "Cancelar"
			onClick [ | this.close ]
		]
		
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [ | 
				this.modelObject.setItem(item)
				this.close
			]
		]
   	}
}