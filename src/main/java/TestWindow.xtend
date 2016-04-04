import ar.edu.unq.ciu.GatoEncerradoDominio.Test
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.ciu.GatoEncerradoDominio.AcaHayGatoEncerradoAppModel

class TestWindow extends MainWindow<Test>{

    new () {
        super(new Test)
    }

    override createContents(Panel mainPanel) {
        new PantallaPrincipalWindow(this, new AcaHayGatoEncerradoAppModel()).open
    }

    def static main(String[] args) {
        new TestWindow().startApplication
    }
}
