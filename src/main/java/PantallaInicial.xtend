import ar.edu.unq.ciu.GatoEncerradoAppModel.AcaHayGatoEncerradoAppModel
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel

class PantallaInicial extends MainWindow<AcaHayGatoEncerradoAppModel> {

	new (AcaHayGatoEncerradoAppModel model){
		super(model)
	}

	override createContents(Panel mainPanel) {
		this.title = "holas"
		new PantallaPrincipalWindow(this, modelObject).open
	}
}