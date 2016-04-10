
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class MainPanel extends Application {
	
	static def void main(String[] args) { 
		new MainPanel().start()
	}

	override protected Window<?> createMainWindow() {
		//return new NuevaAccionWindow(new Habitacion()).startApplication
	}
	
}