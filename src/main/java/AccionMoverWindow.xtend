import ar.edu.unq.ciu.GatoEncerradoDominio.AccionMover
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion
import ar.edu.unq.ciu.GatoEncerradoDominio.MoverAppModel
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AccionMoverWindow extends Dialog<MoverAppModel>{

    new (WindowOwner owner, MoverAppModel model) {
        super(owner, model)
    }

    override createFormPanel(Panel mainPanel) {
        this.title = "Agregar accion de ir a otra habitacion"
        new Label(mainPanel).text = "Seleccione una habitación a la cual ir"
     	new Selector<Habitacion>(mainPanel) => [
     		allowNull(false)
     		value <=> "habitacionSeleccionada"
     		(items <=> "habitaciones").adapter = new PropertyAdapter(Habitacion, "nombre")
		]
		this.addButtons(mainPanel)
	}
    
   def void addButtons(Panel mainPanel){
		var panelButtons = new Panel(mainPanel)
       	panelButtons.setLayout(new HorizontalLayout)
			new Button(mainPanel) => [
			caption = "Cancelar"
			onClick [ | this.close ]
		]
		val accionMover = new AccionMover(this.modelObject.habitacionSeleccionada)
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [ | this.modelObject.agregarAccionMover(accionMover)]
		]
 	}
		    
}