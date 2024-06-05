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
    MOV X3, 549              // x1 (esquina inferior izquierda)
    MOV X4, 165              // y1 (esquina inferior izquierda)
    MOV X5, 559              // x2 (esquina superior derecha)
    MOV X6, 172              // y2 (esquina superior derecha)
    LDR X7, =FUEGO    // color (cargar el color desde una dirección de memoria)
    BL dibujarCuadrado        // Llamar a la función dibujarCuadrado

	// --- AQUI DEJO DE DIBUJAR EL PRIMER CUADRADO (FUEGUITO DE LA DERECHA DEL PRIMER FRAME del 'PIXELART')

	MOV X3, 529            
    MOV X4, 172              
    MOV X5, 539              
    MOV X6, 179            
    LDR X7, =FUEGO   
    BL dibujarCuadrado        

	MOV X3, 529              
    MOV X4, 142              
    MOV X5, 539              
    MOV X6, 149              
    LDR X7, =FUEGO   
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


// AQUI VIENEN LAS SOMBRAS DE LA FOGATA:
    MOV X3, 491  
    MOV X4, 308   
    MOV X5, 499 
    MOV X6, 321 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

	MOV X3, 500  
    MOV X4, 323   
    MOV X5, 528 
    MOV X6, 329 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

	MOV X3, 531  
    MOV X4, 315   
    MOV X5, 559 
    MOV X6, 321 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

	MOV X3, 551  
    MOV X4, 308   
    MOV X5, 559 
    MOV X6, 314 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

	MOV X3, 560  
    MOV X4, 300   
    MOV X5, 568 
    MOV X6, 314 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

	MOV X3, 500  
    MOV X4, 300   
    MOV X5, 508 
    MOV X6, 306 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

	MOV X3, 591  
    MOV X4, 300   
    MOV X5, 599 
    MOV X6, 314 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

	MOV X3, 600
    MOV X4, 308   
    MOV X5, 608 
    MOV X6, 314 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

	MOV X3, 611  
    MOV X4, 315   
    MOV X5, 639 
    MOV X6, 321 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

	MOV X3, 511  
    MOV X4, 293   
    MOV X5, 519 
    MOV X6, 299 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

	MOV X3, 611  
    MOV X4, 293   
    MOV X5, 639 
    MOV X6, 306 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 




	MOV X3, 500  
    MOV X4, 307   
    MOV X5, 508 
    MOV X6, 321 
    LDR X7, =COLOR_NEGRO    
    BL dibujarCuadrado 

	MOV X3, 509  
    MOV X4, 315   
    MOV X5, 528 
    MOV X6, 321 
    LDR X7, =COLOR_NEGRO    
    BL dibujarCuadrado 

	MOV X3, 531  
    MOV X4, 308   
    MOV X5, 548 
    MOV X6, 314 
    LDR X7, =COLOR_NEGRO    
    BL dibujarCuadrado 

	MOV X3, 551  
    MOV X4, 300   
    MOV X5, 550 
    MOV X6, 306 
    LDR X7, =COLOR_NEGRO    
    BL dibujarCuadrado 

	MOV X3, 551  
    MOV X4, 300   
    MOV X5, 559 
    MOV X6, 306 
    LDR X7, =COLOR_NEGRO    
    BL dibujarCuadrado 

	MOV X3, 600  
    MOV X4, 300   
    MOV X5, 608 
    MOV X6, 306 
    LDR X7, =COLOR_NEGRO    
    BL dibujarCuadrado

	MOV X3, 611  
    MOV X4, 308   
    MOV X5, 639 
    MOV X6, 314 
    LDR X7, =COLOR_NEGRO    
    BL dibujarCuadrado  


// AHORA A DIBUJAR LA MADERA
	MOV X3, 509  
    MOV X4, 307   
    MOV X5, 528 
    MOV X6, 314 
    LDR X7, =MADERA    
    BL dibujarCuadrado 

	MOV X3, 511
    MOV X4, 300   
    MOV X5, 548 
    MOV X6, 306 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

	MOV X3, 540  
    MOV X4, 292   
    MOV X5, 559 
    MOV X6, 299 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

	MOV X3, 580  
    MOV X4, 293   
    MOV X5, 608 
    MOV X6, 299 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado 

/* 	MOV X3, 611  
    MOV X4, 300   
    MOV X5, 639 
    MOV X6, 314 
    LDR X7, =TRONCOS    
    BL dibujarCuadrado  */

// AHORA DIBUJO LAS CHISPAS MAS CERCANAS AL FUEGO
	MOV X3, 520
    MOV X4, 292   
    MOV X5, 539 
    MOV X6, 299 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado 

	MOV X3, 530
    MOV X4, 285   
    MOV X5, 550 
    MOV X6, 291 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado 

    MOV X3, 600
    MOV X4, 285   
    MOV X5, 619 
    MOV X6, 291 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado 

	MOV X3, 620
    MOV X4, 292   
    MOV X5, 639 
    MOV X6, 299 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado 

	MOV X3, 530
    MOV X4, 263   
    MOV X5, 550 
    MOV X6, 284 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado 

	MOV X3, 520
    MOV X4, 262   
    MOV X5, 529 
    MOV X6, 269 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado 

	MOV X3, 550
    MOV X4, 195   
    MOV X5, 579 
    MOV X6, 296 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado  

    MOV X3, 580
    MOV X4, 240   
    MOV X5, 599 
    MOV X6, 284 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado  

	MOV X3, 589
    MOV X4, 255   
    MOV X5, 605 
    MOV X6, 269 
    LDR X7, =CHISPAS    
    BL dibujarCuadrado 

	MOV X3, 554
    MOV X4, 244   
    MOV X5, 585 
    MOV X6, 279 
    LDR X7, =FUEGO    
    BL dibujarCuadrado  

	MOV X3, 560
    MOV X4, 203   
    MOV X5, 570 
    MOV X6, 250 
    LDR X7, =FUEGO    
    BL dibujarCuadrado  

	MOV X3, 532
    MOV X4, 250   
    MOV X5, 556 
    MOV X6, 254 
    LDR X7, =FUEGO    
    BL dibujarCuadrado 

    //CHISPITA DE LA DERECHA

	MOV X3, 585
    MOV X4, 270   
    MOV X5, 592 
    MOV X6, 275 
    LDR X7, =FUEGO    
    BL dibujarCuadrado 




	//---------------------------------------------------------------
	// Infinite Loop
InfLoop:
	b InfLoop
