.include "framebuffer.s"
.include "gpio.s" 
.include "funciones.s"
.include "colores.s"


.globl main
main:
	//---------------- CODE HERE ------------------------------------

	// DIBUJO PIXEL:
	MOV X1, 569	 
	MOV X2, 165
	LDR X7, =COLOR_FUEGO_0
	BL dibujar_pixel                             // IMANOL CARROZZO


    // ---  AQUI DIBUJO CUADRADO (CHISPA) ---				 // IMANOL CARROZZO

    // Coordenadas de las esquinas opuestas del cuadrado
    // Establecer las coordenadas del cuadrado y el color:
    MOV X3, 569              // x1 (esquina inferior izquierda)
    MOV X4, 165              // y1 (esquina inferior izquierda)
    MOV X5, 579              // x2 (esquina superior derecha)
    MOV X6, 172              // y2 (esquina superior derecha)
    LDR X7, =COLOR_FUEGO_0    // color (cargar el color desde una dirección de memoria)

    BL dibujarCuadrado        // Llamar a la función dibujarCuadrado

	// --- AQUI DEJO DE DIBUJAR EL PRIMER CUADRADO (FUEGUITO DE LA DERECHA DEL PRIMER FRAME del 'PIXELART')


	//---------------------------------------------------------------
	// Infinite Loop
InfLoop:
	b InfLoop
