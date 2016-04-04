import ar.edu.unq.ciu.GatoEncerradoDominio.Test
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel

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
