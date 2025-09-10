object rolando {
 var tamañoMochila = 2
 
const mochila = #{ } 


method obtenerObjeto(objeto){
    if (2 > mochila.size()){
        mochila.add(objeto)
       
    }

    
}
method mochila(){
    return mochila
}

method llegarAlCastillo(){
    castilloDePiedra.artefactos().addAll(mochila)
    mochila.clear()
    
}

method posesiones(){
    return self.mochila() + castilloDePiedra.artefactos()
}

method tiene(objeto){
    return self.posesiones().contains(objeto)
}
}

object castilloDePiedra {
    
    const artefactos = #{espadaDelDestino }

method artefactos(){
    return artefactos
}
}

object espadaDelDestino {

}

object libroDeHechizos {

}

object collarDivino {

}

object armaduraDeAceroValyrio {

}