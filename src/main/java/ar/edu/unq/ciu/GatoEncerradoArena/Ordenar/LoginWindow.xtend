package ar.edu.unq.ciu.GatoEncerradoArena.Ordenar

import ar.edu.unq.ciu.GatoEncerradoDominio.Login
import java.awt.Color
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.PasswordField
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import ar.edu.unq.ciu.GatoEncerradoAppModel.AcaHayGatoEncerradoAppModel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.windows.ErrorsPanel

class LoginWindow extends MainWindow<Login> {
		
	new(Login model) {
		super(model)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Login Gato Encerrado"

        new ErrorsPanel(mainPanel, "Ingrese usuario y contrasenia")

		val panelArriba = new Panel(mainPanel)
		panelArriba.layout = new ColumnLayout(2)

		new Label(panelArriba).text = "Usuario"
		new TextBox(panelArriba).value <=> "nombreUsuario"
		
		new Label(panelArriba).text = "Contraseña"
		new PasswordField(panelArriba).value <=> "passwordUsuario"

		new Button(mainPanel) => [
            caption = "Ingresar"
            onClick [ | ingresar ]
        ]
    }

	def ingresar() {
            modelObject.validarIngreso
			var appModel = new AcaHayGatoEncerradoAppModel
			new PantallaPrincipalWindow(this, appModel ).open
	}

}
