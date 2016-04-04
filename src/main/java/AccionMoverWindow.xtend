import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.ciu.GatoEncerradoDominio.AccionMover

class AccionMoverWindow extends Dialog<AccionMover>{

    new (WindowOwner owner, AccionMover accion) {
        super(owner, accion)
    }

    override createFormPanel(Panel mainPanel) {
        this.title = "adskflsf"
    }
}