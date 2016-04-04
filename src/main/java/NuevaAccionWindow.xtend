import ar.edu.unq.ciu.GatoEncerradoDominio.AccionUsar
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Selector



class NuevaAccionWindow extends MainWindow<AccionUsar>{

    new () {
        super(new AccionUsar)
    }

    override createContents(Panel mainPanel) {
        this.title = "Agregar accion de usar un elemento"
        new Label(mainPanel).text = "Seleccione un elemento que pueda ser usado"

        new Selector(mainPanel)

        new Label(mainPanel).text = "Cree la accion a realizar"

        new Button(mainPanel) => [
            caption = "Agregar "
            onClick [ | this.modelObject.convertir ]
        ]
        new Label(mainPanel)
        .value <=> "kilometros"

    }

    def static main(String[] args) {
        new AgregarAccionDeUsarUnELementoWIndow().startApplication
    }

}