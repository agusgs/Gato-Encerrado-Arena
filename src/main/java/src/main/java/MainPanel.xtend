package src.main.java

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import ar.edu.unq.ciu.GatoEncerradoDominio.Habitacion

class MainPanel extends Application {
	
	static def void main(String[] args) { 
		new MainPanel().start()
	}

	override protected Window<?> createMainWindow() {
		return new AgregarAccionAgarrarUnElementoWindow(this, new Habitacion)
	}
	
}