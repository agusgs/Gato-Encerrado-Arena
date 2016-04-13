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

class LoginWindow extends MainWindow<Login> {
		
	new(Login model) {
		super(model)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Ingreso a Gato Encerrado"
		
		val panelArriba = new Panel(mainPanel)
		panelArriba.layout = new ColumnLayout(2)
		new Label(panelArriba).text = "Usuario"
		new TextBox(panelArriba).value <=> "usuario"
		
		new Label(panelArriba).text = "Contraseña"
		new PasswordField(panelArriba).value <=> "password"
		
		val panelProvisorio = new Panel(mainPanel)
		panelProvisorio.layout = new HorizontalLayout
		new Label(panelProvisorio) => [
			text = "Por ahora, password = interfaces"
			background = Color.GRAY
			foreground = Color.BLACK
		]	

		new Button(mainPanel) => [
            caption = "Ingresar" //quitar el if de alguna forma
            onClick [ | this.ingresar ]
        ]
		
		new Label(mainPanel) => [
			background = Color.BLUE
			foreground = Color.YELLOW
			value <=> "passwordOk"	
		]
		
	}
	
	def ingresar() {
		if (modelObject.passwordOk) {
			var appModel = new AcaHayGatoEncerradoAppModel
			new PantallaPrincipalWindow(this, appModel ).open	
		}
			
	}

}
