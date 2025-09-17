object rolando {
 var tamañoMochila = 2
 var hogar = castilloDePiedra
 const ordenDeEncuentros = []
 var property poderBase = 5
const mochila =  #{}

method tamañoMochila(nuevoTamaño){
    tamañoMochila = nuevoTamaño
}

method mochila(){
    return mochila
}

method hogar(){
    return hogar
}


method poderTotal(){
    return poderBase + self.poderDeArtefactos()
}

method poderDeArtefactos(){
    return mochila.sum{artefacto => artefacto.poder()}
}
    

method ordenDeEncuentros(){
    return ordenDeEncuentros
}


method encontrarObjeto(objeto){
 ordenDeEncuentros.add(objeto)
    if (2 > mochila.size()){
        mochila.add(objeto)
       objeto.dueño(self)
    }
}


method batallar(){
 mochila.forEach({artefacto => artefacto.desgastarse()} )
 poderBase = poderBase + 1

}





method llegarACasa(){
    hogar.esconderObjetos(mochila)
    mochila.clear()

}

method posesiones(){
    return mochila + hogar.artefactos()

}
/*
otra forma de hacerlo 
method posesiones(){
    return mochila.union(hogar.artefactos())

}

*/



method tiene(objeto){
    return self.posesiones().contains(objeto)
}
}

// guaridas -----------------------------------------------------------------
object castilloDePiedra {
    
    const artefactos = #{}

method artefactos(){
    return artefactos
}

method esconderObjetos(objetos){
    artefactos.addAll(objetos)
}

method mayorArtefacto(){
    return artefactos.max{artefacto => artefacto.poder()}
}
}


//artefactos-------------------------------------------------------------------------
object espadaDelDestino {
    var dueño = rolando
    var utilización = 0

method poder(){
    if (utilización < 1){
        return dueño.poderBase()
    }
    else{
        return dueño.poderBase() / 2
    }
}
method desgastarse(){
    utilización = utilización + 1
  }
 }

object libroDeHechizos {
  var dueño = rolando
  var utilización = 0

  const hechizos = []

method dueño(){
    return dueño
}
  method desgastarse(){
    hechizos.remove(hechizos.first())
  }
//get(0)indice , first primer elemento, head (lo mismo)/ solo para la listas 
  method poder(){
    return hechizos.first().poder()
  }

    method aprenderHechizo(hechizo){
        hechizos.add(hechizo)
 }
}

object collarDivino {
  var dueño = rolando
  var utilización = 0

   method desgastarse(){
    utilización = utilización + 1
  }

  method poder(){
    if (dueño.poderBase() > 6)
     return 3 + utilización
  
   else {
    return 3
   }
  }

}

object armaduraDeAceroValyrio {
  var dueño = rolando
  
   method desgastarse(){
  }

  method poder(){
    return 6
  }
}

//hechizos---------------------------------------------------------------------------
object bendicion {
    method poder(){
        return 4
    }
}

object invisibilidad {

    method poder(){
        return libroDeHechizos.dueño().poderBase() 
    }
}

object invocación{
    method poder(){
        return libroDeHechizos.dueño().hogar().mayorArtefacto().poder()
    }
}