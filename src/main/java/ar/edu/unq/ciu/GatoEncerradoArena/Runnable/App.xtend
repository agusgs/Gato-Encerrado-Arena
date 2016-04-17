package ar.edu.unq.ciu.GatoEncerradoArena.Runnable

import ar.edu.unq.ciu.GatoEncerradoArena.Ordenar.LoginWindow
import ar.edu.unq.ciu.GatoEncerradoArena.Ordenar.ProovedorDeObjetos

class App {
    
    def static main(String[] args) {
        
        //new PantallaLoguin(new ProovedorDeObjetos().crearAppModel()).startApplication
    	new LoginWindow(nuevoLogin()).startApplication
    
    }

    def static nuevoLogin(){
        var po = new ProovedorDeObjetos
        return po.nuevoLogin
    }
}