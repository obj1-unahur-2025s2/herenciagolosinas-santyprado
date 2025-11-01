import golosinas.*

object mariano {
	const golosinas = []
	 
	method comprar(_golosina) { golosinas.add(_golosina) }
	
	method desechar (_golosina) { golosinas.remove(_golosina) }
	
	method golosinas() { return golosinas }
	method primerGolosina() { return golosinas.first() }
	method ultimaGolosina() { return golosinas.last() }
	
	method pesoGolosinas() { 
		return golosinas.sum({ golo => golo.peso() })
	}
	
	method probarGolosinas() {
		golosinas.forEach( {_golosina => _golosina.mordisco() } )
	}
	
	method golosinaMasPesada() { 
		return golosinas.max({ golo => golo.peso() })
	}
	
	method hayGolosinaSinTACC() {
		return golosinas.any({ _golosina => _golosina.libreGluten()}) 
	}
	
	method preciosCuidados() {
		return golosinas.all({ _golosina => _golosina.precio() < 10}) 
	}
	
	
	
	method golosinaDeSabor(_sabor) {
		return golosinas.find({ golosina => golosina.sabor() == _sabor })
	}
	
	method golosinasDeSabor(_sabor) {
		return golosinas.filter({ golosina => golosina.sabor() == _sabor })
	}
	
	method sabores() {
		return golosinas.map({ golosina => golosina.sabor() }).asSet()
	}



	method golosinaMasCara() {
		return golosinas.max( { _golosina => _golosina.precio() } )
	}

	method golosinasFaltantes(golosinasDeseadas) {
		return golosinasDeseadas.difference(golosinas)	
	}


	method saboresFaltantes(_saboresDeseados) {
		return _saboresDeseados.filter({_saborDeseado => ! self.tieneGolosinaDeSabor(_saborDeseado)})	
	}
	
	method tieneGolosinaDeSabor(_sabor) {
		return golosinas.any({_golosina => _golosina.sabor() == _sabor})
	}
	method comprarBombon() {golosinas.add(new Bombon())}
	method comprarAlfajor() {golosinas.add(new Alfajor())}
	method comprarCaramelo(unSabor) {golosinas.add(new Caramelo(sabor=unSabor))}
	method comprarChupetin() {golosinas.add(new Chupetin())}
	method comprarOblea(){golosinas.add(new Oblea())}
	method comprarChupelatin(unPeso){golosinas.add(new Chocolatin(pesoInicial = unPeso))}
	method comprarTuttiFrutti(esLibreDeGluten) {golosinas.add(new Tuttifrutti(libreDeGluten =esLibreDeGluten))}
	method comprarGolosinaBaniada(unaGolosinaInterior){golosinas.add(new GolosinaBaniada(golosinaInterior = unaGolosinaInterior))}
	method comprarGolosinas(golosinasAComprar)= golosinasAComprar.forEach({g=>golosinas.add(g)})
	method baniar(unaGolosina){self.comprarGolosinaBaniada(unaGolosina)}
}

object heladeraMariano {
  var property humedad = 0
	method initialize() {
		if (!humedad.between(0, 1)) {self.error("Puede tener una humedad entre 0 y 1")}
	}
}