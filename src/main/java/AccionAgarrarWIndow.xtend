import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout

class AccionAgarrarWindow extends Dialog<AccionAgarrar>{

    new (WindowOwner owner, AccionAgarrar accion) {
        super(owner, accion)
    }

    override createFormPanel(Panel mainPanel) {
    	this.title = "Agregar accion de Agarrar un elemento"
		this.crearLabel(mainPanel)
		this.crearBotones(mainPanel)
	}
	
	def void crearLabel(Panel mainPanel){
		var panelDeLabel = new Panel(mainPanel)
       	panelDeLabel.setLayout(new VerticalLayout)
		new Label(mainPanel).text = "Escriba una habitacion a la cual ir"
		val nombreItem = new TextBox(mainPanel).value.toString
		//item.setNombre(nombreItem) 
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
			//onClick [ | this.modelObject.agregarAccion(accion) ]
		]
   	}
}