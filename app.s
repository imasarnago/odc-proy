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


// PINTO EL FONDO DEL BOSQUE A CONTINUACION
mov x3, 0
mov x4, 0
mov x5, SCREEN_WIDTH
mov x6, SCREEN_HEIGHT
LDR x7, =COLOR_CIELO
BL dibujarCuadrado




    // ---  AQUI DIBUJO CUADRADO (CHISPA) ---				 // IMANOL CARROZZO

    // Coordenadas de las esquinas opuestas del cuadrado
    // Establecer las coordenadas del cuadrado y el color:
    MOV X3, 549              // x1 (esquina inferior izquierda)
    MOV X4, 165              // y1 (esquina inferior izquierda)
    MOV X5, 559              // x2 (esquina superior derecha)
    MOV X6, 172              // y2 (esquina superior derecha)
    LDR X7, =COLOR_FUEGO_0    // color (cargar el color desde una dirección de memoria)
    BL dibujarCuadrado        // Llamar a la función dibujarCuadrado

	// --- AQUI DEJO DE DIBUJAR EL PRIMER CUADRADO (FUEGUITO DE LA DERECHA DEL PRIMER FRAME del 'PIXELART')



	MOV X3, 529            
    MOV X4, 172              
    MOV X5, 539              
    MOV X6, 179            
    LDR X7, =COLOR_FUEGO_0   
    BL dibujarCuadrado        

	MOV X3, 529              
    MOV X4, 142              
    MOV X5, 539              
    MOV X6, 149              
    LDR X7, =COLOR_FUEGO_0   
    BL dibujarCuadrado       
							
						// -- HASTA AQUI EL DIBUJO DE LAS CHISPAS DEL FUEGO


			// AQUI DIBUJO EL TRONCO

	MOV X3, 569  
    MOV X4, 127   
    MOV X5, 619 
    MOV X6, 298 
    LDR X7, =COLOR_ARBOL    
    BL dibujarCuadrado      
 

            
            // DEJO DE DIBUJAR EL TRONCO DEL ARBOL
            // EMPIEZO A DIBUJAR LA COPA DEL ARBOL

	MOV X3, 470  
    MOV X4, 15   
    MOV X5, 639 
    MOV X6, 129 
    LDR X7, =COLOR_COPA    
    BL dibujarCuadrado  
// DETALLES:
	MOV X3, 465  
    MOV X4, 24  
    MOV X5, 484 
    MOV X6, 43 
    LDR X7, =COLOR_MANZANA    
    BL dibujarCuadrado      

	MOV X3, 622
    MOV X4, 61  
    MOV X5, 638 
    MOV X6, 85
    LDR X7, =COLOR_MANZANA    
    BL dibujarCuadrado  

    MOV X3, 555  
    MOV X4, 100  
    MOV X5, 579 
    MOV X6, 120 
    LDR X7, =COLOR_MANZANA    
    BL dibujarCuadrado  


            // DIBUJO EL PASTO
	MOV X3, 0  
    MOV X4, 298   
    MOV X5, 640 
    MOV X6, 483 
    LDR X7, =COLOR_PASTO    
    BL dibujarCuadrado    
  






	//---------------------------------------------------------------
	// Infinite Loop
InfLoop:
	b InfLoop
