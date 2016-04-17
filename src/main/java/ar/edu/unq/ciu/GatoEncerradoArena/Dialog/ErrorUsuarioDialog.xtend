package ar.edu.unq.ciu.GatoEncerradoArena.Dialog

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.commons.model.UserException

class ErrorUsuarioDialog extends Dialog<UserException>{

    new (WindowOwner owner, UserException model) {
        super(owner, model)
    }

    override createFormPanel(Panel mainPanel) {
        this.title = "Error"

        var advertencia = new Panel(mainPanel)
        advertencia.setLayout(new HorizontalLayout)

        new Label(advertencia).text = modelObject.message

        var panelBotones = new Panel(mainPanel)
        panelBotones.setLayout(new HorizontalLayout)

        new Button(panelBotones) => [
            caption = "Cancelar"
            onClick [ | this.close ]
        ]
    }
}