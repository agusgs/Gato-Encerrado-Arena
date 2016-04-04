import ar.edu.unq.ciu.GatoEncerradoDominio.AcaHayGatoEncerradoAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class PantallaPrincipalWindow extends SimpleWindow<AcaHayGatoEncerradoAppModel>{

    new (WindowOwner parent, AcaHayGatoEncerradoAppModel model) {
        super(parent, model)
    }
    override addActions(Panel actionsPanel) {
        throw new UnsupportedOperationException()
    }

    override createFormPanel(Panel mainPanel) {
        throw new UnsupportedOperationException()
    }
}