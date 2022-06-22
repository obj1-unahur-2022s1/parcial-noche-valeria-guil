import comidas.*

class Comensales {
	var property peso 
	var property comidasIngeridas = []
	
	method leAgrada(unaComida) 
	method comer(unaComida) { comidasIngeridas.add(unaComida)}
	method estaSatisfecho() = self.pesoComidasQueIngerio() >= peso * 0.01 
	method pesoComidasQueIngerio() = comidasIngeridas.sum({c => c.peso()})
	method cantidadComidasIngeridas() = comidasIngeridas.size()
}


class Vegetarianos inherits Comensales {
	
	override method leAgrada(unaComida) = 
		unaComida.aptoVegetariano() and unaComida.valoracion() > 85
	override method estaSatisfecho() = super() and self.noIngirioComidaAbundante()
	
	method noIngirioComidaAbundante() =
		comidasIngeridas.all({c => not c.esAbundante()})
}

class HambrePopular inherits Comensales {
	
	override method leAgrada(unaComida) = unaComida.esAbundante()
}

class PaladarFino inherits Comensales {
	
	override method leAgrada(unaComida) = 
		unaComida.peso().between(150,300) and unaComida.valoracion() > 100

	override method estaSatisfecho() = super() and self.cantidadComidaIngeridaEsPar()
	
	method cantidadComidaIngeridaEsPar() =
		self.cantidadComidasIngeridas() == 0.abs() 
}



