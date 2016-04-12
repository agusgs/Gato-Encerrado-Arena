import ar.edu.unq.ciu.GatoEncerradoDominio.AcaHayGatoEncerradoAppModel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout

class HabitacionQuitarDialog extends Dialog<AcaHayGatoEncerradoAppModel>{

    new (WindowOwner owner, AcaHayGatoEncerradoAppModel model) {
        super(owner, model)
    }

    override createFormPanel(Panel mainPanel) {
        this.title = "Quitar Habitacion"

        var advertencia = new Panel(mainPanel)
        advertencia.setLayout(new HorizontalLayout)

        new Label(advertencia).text = "Va a eliminar la habitacion "
        new Label(advertencia).bindValueToProperty("habitacionSeleccionada.nombre")

        var panelBotones = new Panel(mainPanel)
        panelBotones.setLayout(new HorizontalLayout)

        new Button(panelBotones) => [
            caption = "Aceptar"
            onClick [ | this.modelObject.quitarHabitacion; this.close ]
        ]

        new Button(panelBotones) => [
            caption = "Cancelar"
            onClick [ | this.close ]
        ]
    }
}