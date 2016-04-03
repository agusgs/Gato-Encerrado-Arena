import ar.edu.unq.ciu.GatoEncerradoDominio.Laberinto
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel

class TestWindow extends MainWindow<Laberinto>{

    new () {
        super(new Laberinto)
    }

    override createContents(Panel mainPanel) {
        this.title = "funco"
    }

    def static main(String[] args) {
        new TestWindow().startApplication
    }
}
