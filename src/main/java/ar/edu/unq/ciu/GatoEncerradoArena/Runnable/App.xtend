package ar.edu.unq.ciu.GatoEncerradoArena.Runnable

import ar.edu.unq.ciu.GatoEncerradoArena.Ordenar.PantallaLoguin
import ar.edu.unq.ciu.GatoEncerradoArena.Ordenar.ProovedorDeObjetos
import ar.edu.unq.ciu.GatoEncerradoArena.Ordenar.LoginWindow
import ar.edu.unq.ciu.GatoEncerradoDominio.Login

class App {
    
    def static main(String[] args) {
        
        //new PantallaLoguin(new ProovedorDeObjetos().crearAppModel()).startApplication
    	new LoginWindow(new Login).startApplication
    
    }
}