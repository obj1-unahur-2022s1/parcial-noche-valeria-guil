class Plato {
	
	method peso()
	
	method valoracion()
	
	method aptoVegetariano()
	
	method esAbundante() = self.peso() > 250
	
}

class Provoleta inherits Plato {
	var property peso
	var property tieneEspecias 
	
	override method aptoVegetariano() = not tieneEspecias
	
	override method valoracion() = if(self.esEspecial()) {120} else {80}
	
	method esEspecial() = self.esAbundante() or tieneEspecias
	
}

class HamburguesaCarne inherits Plato {
	var property pan 
	override method peso() = 250
	override method aptoVegetariano() = false 
	
	override method valoracion() = 60 + pan.valoracion()
}

object panIndustrial {
	method valoracion() = 0
}

object panCasero {
	method valoracion() = 20
}

object panMasaMadre {
	method valoracion() = 45
}


class HamburguesaVegetariana inherits HamburguesaCarne {
	var property legumbre
	
	override method aptoVegetariano() = true 
	
	override method valoracion() = super() + self.plus()	
	
	method plus() =
		self.cantidadLetras() * 2
		
	method cantidadLetras() =
		17.max(legumbre.size())
}

class Parrillada inherits Plato {
	var property cortesPedidos = []
	override method peso() =
		cortesPedidos.sum({c => c.peso()})

	override method aptoVegetariano() = false 
	
	override method valoracion() = (15 * self.maximaCalidad() - self.cantidadDeCortes()).max(0)
	
	method cantidadDeCortes() = cortesPedidos.size()
	
	method maximaCalidad()= 
		cortesPedidos.max({c => c.calidad()})
		
	method agregarCorte(unCorte) {
		cortesPedidos.add(unCorte)
	}
}

class Corte {
	var property calidad 
	var property peso 
}
