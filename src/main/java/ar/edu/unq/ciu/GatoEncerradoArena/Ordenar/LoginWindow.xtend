package ar.edu.unq.ciu.GatoEncerradoArena.Ordenar

import ar.edu.unq.ciu.GatoEncerradoArena.Dialog.ErrorUsuarioDialog
import ar.edu.unq.ciu.GatoEncerradoDominio.Login
import java.util.ArrayList
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.PasswordField
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow
import org.uqbar.commons.model.UserException

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import ar.edu.unq.ciu.GatoEncerradoAppModel.AcaHayGatoEncerradoAppModel
import org.uqbar.arena.layout.ColumnLayout

class LoginWindow extends MainWindow<Login> {
		
	new(Login model) {
		super(model)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Login Gato Encerrado"

        val errorPanel = new Panel(mainPanel)
        val errorLabel = newArrayList(new Label(errorPanel).text = "Ingrese usuario y contrasenia")

		val panelArriba = new Panel(mainPanel)
		panelArriba.layout = new ColumnLayout(2)

		new Label(panelArriba).text = "Usuario"
		new TextBox(panelArriba).value <=> "nombreUsuario"
		
		new Label(panelArriba).text = "Contraseña"
		new PasswordField(panelArriba).value <=> "passwordUsuario"

		new Button(mainPanel) => [
            caption = "Ingresar"
            onClick [ | ingresar(errorLabel) ]
        ]
    }

	def ingresar(ArrayList<Label> errorLabel) {
        try{
            var appModel = new AcaHayGatoEncerradoAppModel
            appModel.usuario = modelObject.usuarioQueMachea()

            new PantallaPrincipalWindow(this, appModel ).open
        }catch(UserException exception){
            new ErrorUsuarioDialog(this, exception).open
        }
	}
}
