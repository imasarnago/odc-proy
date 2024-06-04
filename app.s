.include "framebuffer.s"
.include "gpio.s" 
.include "funciones.s"
.include "colores.s"


.globl main
main:
	//---------------- CODE HERE ------------------------------------

/* 	// DIBUJO PIXEL:
	MOV X1, 569	 
	MOV X2, 165
	LDR X7, =COLOR_FUEGO_0
	BL dibujar_pixel                             // IMANOL CARROZZO */


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



	MOV X3, 549            
    MOV X4, 172              
    MOV X5, 559              
    MOV X6, 179            
    LDR X7, =COLOR_FUEGO_0   
    BL dibujarCuadrado        

	MOV X3, 549              
    MOV X4, 142              
    MOV X5, 559              
    MOV X6, 149              
    LDR X7, =COLOR_FUEGO_0   
    BL dibujarCuadrado       
							
						// -- HASTA AQUI EL DIBUJO DE LAS CHISPAS DEL FUEGO


			// AQUI DIBUJO EL TRONCO

	MOV X3, 589        
    MOV X4, 117              
    MOV X5, 619              
    MOV X6, 132              
    LDR X7, =COLOR_ARBOL    
    BL dibujarCuadrado        

	//---------------------------------------------------------------
	// Infinite Loop
InfLoop:
	b InfLoop
