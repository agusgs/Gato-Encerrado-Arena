import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionAgarrar

class AccionAgarrarWindow extends Dialog<AccionAgarrar>{

    new (WindowOwner owner, AccionAgarrar accion) {
        super(owner, accion)
    }

    override createFormPanel(Panel mainPanel) {
        this.title = "adskflsf"
    }
}