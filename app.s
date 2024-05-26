.include "framebuffer.s"
.include "gpio.s" 
.include "funciones.s"
.include "colores.s"

.globl main
main:
	//---------------- CODE HERE ------------------------------------

	// Input:
	MOV X1, 569	 
	MOV X2, 165
	LDR X7, =COLOR_FUEGO_0
	// ---      CAJA NEGRA      --- 
	BL dibujar_pixel                             // IMANOL CARROZZO
	// ---  FIN CAJA NEGRA      --- 


    // ---  AQUI  ---							 // IMANOL CARROZZO



	//---------------------------------------------------------------
	// Infinite Loop

InfLoop:
	b InfLoop