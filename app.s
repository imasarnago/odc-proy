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


    // ---  AQUI DIBUJO CUADRADO (CHISPA) ---				 // IMANOL CARROZZO
	// Parámetros:
	// X3 - Coordenada X1 (inferior izquierdo)
	// X4 - Coordenada Y1 (inferior izquierdo)
	// X5 - Coordenada X2 (superior derecho)
	// X6 - Coordenada Y2 (superior derecho)
	// X7 - Color (ARGB)

    // Coordenadas de las esquinas opuestas del cuadrado
    mov x3, #569              // x1 (esquina inferior izquierda)
    mov x4, #172              // y1 (esquina inferior izquierda)
    mov x5, #579              // x2 (esquina superior derecha)
    mov x6, #165              // y2 (esquina superior derecha)
    ldr w7, =COLOR_FUEGO_0          // color

    bl dibujarCuadrado        // Llamar a la función para dibujar el cuadrado

	// --- AQUI DEJO DE DIBUJAR EL PRIMER CUADRADO (FUEGUITO DE LA DERECHA DEL PRIMER FRAME del 'PIKSEL')



	//---------------------------------------------------------------
	// Infinite Loop

InfLoop:
	b InfLoop
