import comidas.*
import comensales.*

object cocina {
	var property comidasPreparadas = []
	
	method tieneBuenaOfertaVegana() =
		self.comidasVegetarianas() - self.comidasNoVegetarianas() > 2 
		
	method comidasVegetarianas() =
		comidasPreparadas.count({c => c.esAptoVegetariano()})
		
	method comidasNoVegetarianas() =
		comidasPreparadas.count({c => not c.esAptoVegetariano()})
	
	method platoMasCarnivoro() = self.comidasNoVegetarianas().max().valoracion() 
	
	method comidasQueLeGustan(unComensal) = 
		comidasPreparadas.filter({c => c.leAgrada(unComensal)}) 
	

}

