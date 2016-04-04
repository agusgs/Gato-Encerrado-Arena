import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionUsar

class AccionUsarWindow extends Dialog<AccionUsar>{

    new (WindowOwner owner, AccionUsar accion) {
        super(owner, accion)
    }

    override createFormPanel(Panel mainPanel) {
        this.title = "adskflsf"
    }
}