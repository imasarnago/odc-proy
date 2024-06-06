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
    MOV X3, 485              // x1 (esquina inferior izquierda)
    MOV X4, 165              // y1 (esquina inferior izquierda)
    MOV X5, 494              // x2 (esquina superior derecha)
    MOV X6, 172              // y2 (esquina superior derecha)
    LDR X7, =FUEGO    // color (cargar el color desde una dirección de memoria)
    BL dibujarCuadrado        // Llamar a la función dibujarCuadrado

	// --- AQUI DEJO DE DIBUJAR EL PRIMER CUADRADO (FUEGUITO DE LA DERECHA DEL PRIMER FRAME del 'PIXELART')

	MOV X3, 464            
    MOV X4, 172              
    MOV X5, 474              
    MOV X6, 179            
    LDR X7, =FUEGO   
    BL dibujarCuadrado        

	MOV X3, 464              
    MOV X4, 142              
    MOV X5, 474              
    MOV X6, 149              
    LDR X7, =FUEGO   
    BL dibujarCuadrado       	
						// -- HASTA AQUI EL DIBUJO DE LAS CHISPAS DEL FUEGO

			// AQUI DIBUJO EL TRONCO
	MOV X3, 544  
    MOV X4, 127   
    MOV X5, 594 
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
    LDR X7, =MANZANA    
    BL dibujarCuadrado      

	MOV X3, 622
    MOV X4, 61  
    MOV X5, 638 
    MOV X6, 85
    LDR X7, =MANZANA    
    BL dibujarCuadrado  

    MOV X3, 555  
    MOV X4, 100  
    MOV X5, 579 
    MOV X6, 120 
    LDR X7, =MANZANA    
    BL dibujarCuadrado  

            // DIBUJO EL PASTO
	MOV X3, 0  
    MOV X4, 298   
    MOV X5, 640 
    MOV X6, 483 
    LDR X7, =COLOR_PASTO    
    BL dibujarCuadrado    
                                    // --- AQUI EMPEZARE A DIBUJAR LA FOGATA ---

    MOV X3, 391    
    MOV X4, 308   
    MOV X5, 399   
    MOV X6, 321 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

    MOV X3, 400  
    MOV X4, 323   
    MOV X5, 428    
    MOV X6, 329 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

    MOV X3, 431   
    MOV X4, 315   
    MOV X5, 459    
    MOV X6, 321 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

    MOV X3, 451    
    MOV X4, 308   
    MOV X5, 459    
    MOV X6, 314 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

    MOV X3, 460  
    MOV X4, 300   
    MOV X5, 468 
    MOV X6, 314 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

    MOV X3, 400    
    MOV X4, 300   
    MOV X5, 408   
    MOV X6, 306 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

    MOV X3, 491    
    MOV X4, 300   
    MOV X5, 499    
    MOV X6, 314 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

    MOV X3, 500    
    MOV X4, 308   
    MOV X5, 508    
    MOV X6, 314 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

    MOV X3, 511    
    MOV X4, 315   
    MOV X5, 539   
    MOV X6, 321 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

    MOV X3, 411  
    MOV X4, 293   
    MOV X5, 419    
    MOV X6, 299 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

    MOV X3, 511   
    MOV X4, 293   
    MOV X5, 539   
    MOV X6, 306 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

    MOV X3, 400    
    MOV X4, 307   
    MOV X5, 408    
    MOV X6, 321 
    LDR X7, =COLOR_NEGRO    
    BL dibujarCuadrado 

    MOV X3, 409    
    MOV X4, 315   
    MOV X5, 428  
    MOV X6, 321 
    LDR X7, =COLOR_NEGRO    
    BL dibujarCuadrado 

    MOV X3, 431    
    MOV X4, 308   
    MOV X5, 448   
    MOV X6, 314 
    LDR X7, =COLOR_NEGRO    
    BL dibujarCuadrado 

    MOV X3, 451   
    MOV X4, 300   
    MOV X5, 450  
    MOV X6, 306 
    LDR X7, =COLOR_NEGRO    
    BL dibujarCuadrado 

    MOV X3, 451  
    MOV X4, 300   
    MOV X5, 459    
    MOV X6, 306 
    LDR X7, =COLOR_NEGRO    
    BL dibujarCuadrado 

    MOV X3, 500    
    MOV X4, 300   
    MOV X5, 508    
    MOV X6, 306 
    LDR X7, =COLOR_NEGRO    
    BL dibujarCuadrado

    MOV X3, 511    
    MOV X4, 308   
    MOV X5, 539  
    MOV X6, 314 
    LDR X7, =COLOR_NEGRO    
    BL dibujarCuadrado  
// AHORA A DIBUJAR LA MADERA
    MOV X3, 409   
    MOV X4, 307   
    MOV X5, 428    
    MOV X6, 314 
    LDR X7, =MADERA    
    BL dibujarCuadrado 

    MOV X3, 411  
    MOV X4, 300   
    MOV X5, 448    
    MOV X6, 306 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

    MOV X3, 440    
    MOV X4, 292   
    MOV X5, 459    
    MOV X6, 299 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

    MOV X3, 480   
    MOV X4, 293   
    MOV X5, 508   
    MOV X6, 299 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 
// AHORA DIBUJO LAS CHISPAS MAS CERCANAS AL FUEGO
    MOV X3, 420    
    MOV X4, 292   
    MOV X5, 439    
    MOV X6, 299 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado 

    MOV X3, 430    
    MOV X4, 285   
    MOV X5, 450    
    MOV X6, 291 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado 

    MOV X3, 500    
    MOV X4, 285   
    MOV X5, 519   
    MOV X6, 291 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado 

    MOV X3, 520    
    MOV X4, 292   
    MOV X5, 539    
    MOV X6, 299 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado 

    MOV X3, 430  
    MOV X4, 263   
    MOV X5, 450    
    MOV X6, 284 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado 

    MOV X3, 420   
    MOV X4, 262   
    MOV X5, 429    
    MOV X6, 269 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado 

    MOV X3, 450  
    MOV X4, 195   
    MOV X5, 479    
    MOV X6, 296 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado  

    MOV X3, 480    
    MOV X4, 240   
    MOV X5, 499    
    MOV X6, 284 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado  

    MOV X3, 489  
    MOV X4, 255   
    MOV X5, 505  
    MOV X6, 269 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado 

    MOV X3, 454   
    MOV X4, 244   
    MOV X5, 485   
    MOV X6, 279 
    LDR X7, =FUEGO    
    BL dibujarCuadrado  

    MOV X3, 460    
    MOV X4, 203   
    MOV X5, 470    
    MOV X6, 250 
    LDR X7, =FUEGO    
    BL dibujarCuadrado  

    MOV X3, 432    
    MOV X4, 250   
    MOV X5, 456    
    MOV X6, 254 
    LDR X7, =FUEGO    
    BL dibujarCuadrado 

    //CHISPITA DE LA DERECHA

    MOV X3, 485   
    MOV X4, 270   
    MOV X5, 492    
    MOV X6, 275 
    LDR X7, =FUEGO    
    BL dibujarCuadrado 

            // DIBUJO LA COPA DEL ARBOL CON UN TRIANGULO (DOS EN REALIDAD)

    // Coordenadas del vértice del triángulo izquierdo (ejemplo)
    MOV X1, #200    // Coordenada x del vértice izquierdo
    MOV X2, #40    // Coordenada y del vértice izquierdo (aumentada en 50)
    MOV X3, #200    // Base del triángulo izquierdo
    MOV X4, #100    // Altura del triángulo izquierdo

    // Llamar a la función para dibujar el triángulo izquierdo
    BL draw_triangleizq



    // Coordenadas del vértice del triángulo derecho (ejemplo)
    MOV X1, #200    // Coordenada x del vértice derecho
    MOV X2, #40    // Coordenada y del vértice derecho (aumentada en 50)
    MOV X3, #50     // Base del triángulo derecho
    MOV X4, #100    // Altura del triángulo derecho

    // Llamar a la función para dibujar el triángulo derecho
    BL draw_triangleder



    MOV X3, 181    
    MOV X4, 140   
    MOV X5, 212    
    MOV X6, 298                      //No tocar este parametro 
    LDR X7, =COLOR_ARBOL   
    BL dibujarCuadrado 
 
 
                                // --- HASTA AQUI LO HECHO POR IMANOL CARROZZO ---

	//---------------------------------------------------------------
	// Infinite Loop
InfLoop:
	b InfLoop
