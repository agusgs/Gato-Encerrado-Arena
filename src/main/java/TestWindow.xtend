import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.ciu.GatoEncerradoDominio.Test

class TestWindow extends MainWindow<Test>{

    new () {
        super(new Test)
    }

    override createContents(Panel mainPanel) {
        this.title = "funco"
    }

    def static main(String[] args) {
        new TestWindow().startApplication
    }
}
