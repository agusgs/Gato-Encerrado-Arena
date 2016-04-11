
import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import ar.edu.unq.ciu.GatoEncerradoDominio.AcaHayGatoEncerradoAppModel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout

class LaberintoNuevoDIalog extends Dialog<AcaHayGatoEncerradoAppModel>{

    new (WindowOwner owner, AcaHayGatoEncerradoAppModel model) {
        super(owner, model)
    }

    override createFormPanel(Panel mainPanel) {
        this.title = "Nuevo Laberinto"

        new Label(mainPanel).text = "Ingrese un nombre para el nuevo laberinto"

        new TextBox(mainPanel).bindValueToProperty("nuevoLaberinto")

        var panelBotones = new Panel(mainPanel)
        panelBotones.setLayout(new HorizontalLayout)

        new Button(panelBotones) => [
            caption = "Aceptar"
            onClick [ | this.modelObject.crearLaberinto; this.close ]
        ]

        new Button(panelBotones) => [
            caption = "Cancelar"
            onClick [ | this.close ]
        ]
    }
}