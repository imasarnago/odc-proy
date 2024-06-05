.ifndef FUNCIONES_S
.equ FUNCIONES_S, 0x000000

.include "framebuffer.s"

             // --- HECHA POR IMANOL
// (x,y) esta en la direccion:   Dirección de inicio + 4 * [x + (y * 640)]  <--- FORMULA DADA EN CLASE
// fun dibujar_pixel(x,y,color) regs:(X1, X2, X7) desc: pixel en (x, y) del color color
// x0 contiene la direccion base del framebuffer
dibujar_pixel:
    MOV X16, SCREEN_WIDTH                // X16 = SCREEN_WIDTH
    MUL X16, X2, X16                     // X16 = X2 * X16 = y * 640
    ADD X16, X1, X16                     // X16 = X1 + X16 = x + (y * 640)
    LSL X16, X16, #2                     // X16 = X16 << 2 = 4 * [x + (y * 640)]
    ADD X16, X0, X16                     // X16 = X0 + X16 = Direccion de inicio + 4 * [x + (y * 640)]
    // X16 TIENE LA DIRECCION DE MEMORIA DEL PUNTO (x,y) segun los registros (X1, X2)
    STR W7, [X16]                        // Pone lo de la parte menos sign. del X7 (color, rojo), en X16
RET

             // --- HECHA POR IMANOL    
/* La idea es que quiero dibujar un cuadrado. No solicitare 4 puntos, sino 2. Uno en la esquina opuesta
    del otro. Asi, los calculos de las otras esquinas son triviales. */
// Parámetros:
// X3 - Coordenada x1 (inferior izquierdo)
// X4 - Coordenada y1 (inferior izquierdo)
// X5 - Coordenada x2 (superior derecho)
// X6 - Coordenada y2 (superior derecho)
// X7 - Color (ARGB)

dibujarCuadrado:
    SUB SP, SP, #40       //40 BYTES. Espacio para cuatro regitros de 64 bits (8 bytes cada registro)
    STR X24, [SP, #0]    // Guardar X24 y X25. Del SP, movemelos a partir de donde indica el SP (8bytes cada uno)
    STR X25, [SP, #8]
    STR X26, [SP, #16]  // Guardar X26 y X27.
    STR X27, [SP, #24]
    STR X30, [SP, #32]

    MOV X24, X3              // Guardar x1 en X24
    MOV X25, X4              // Guardar y1 en X25
    MOV X26, X5              // Guardar x2 en X26
    MOV X27, X6              // Guardar y2 en X27
bucleFila:
    CMP X25, X27             // Comparar Y1 con Y2
    BGT finCuadrado          // Si Y1 > Y2, me pase en alto, entonces termine
    MOV X1, X24              // // Poner x1 en X1 (coordenada x)
bucleColumna:
    CMP X1, X26              // Comparar X1 con X2
    BGT siguienteFila        // Si X1 > X2, paso a la siguiente fila
    // Pintar el píxel actual
    MOV X2, X25              // Poner y1 en X2 (coordenada y)
    BL dibujar_pixel        // Si estoy en una posicion valida (dentro de los limites) pinto dicho pixel
    // Siguiente columna
    ADD X1, X1, #1           // "x1++"
    B bucleColumna          // Repito para el proximo pixel (a la derecha del anterior)
siguienteFila:
    ADD X25, X25, #1         // "y1++"
    B bucleFila              // Repetir para la siguiente fila (subo un escaloncito)

finCuadrado:
    // Restaurar registros modificados
    LDR X24, [SP, #0]                    // Restaurar X24
    LDR X25, [SP, #8]                    // Restaurar X25
    LDR X26, [SP, #16]                   // Restaurar X26
    LDR X27, [SP, #24]                   // Restaurar X27
    LDR X30, [SP, #32]                   // Restaurar X30 (LR)
    ADD SP, SP, #40                      // Liberar espacio en el stack
RET












paint_circle:
    sub sp,sp,#48                   // mem alloc

    str lr,[sp]                     // push to sp
    str x8,[sp,#8]                  // push to sp
    str x9,[sp,#16]                 // push to sp
    str x1,[sp,#24]                 // push to sp 
    str x2,[sp,#32]                 // push to sp
    str x0,[sp,#40]                 // push to sp 

    movz x8,0                       // init a 0
    movz x9,0                       // init a 0
    mov x0,x23

    mov x2, SCREEN_HEIGHT            // Y Size
loop1_crc:  
	mov x1, SCREEN_WIDTH            // X Size
loop0_crc:
    sub x8,x5,x2                    // dist en Y al centro
    sub x9,x6,x1                    // dist en X al centro
    mul x8,x8,x8                    // a^2 -- distancia en Y al cuadrado
    mul x9,x9,x9                    // b^2 -- distancia en X al cuadrado
    add x9,x9,x8                    // a^2 + b^2 -- suma del cuadrado de las distancias
    cmp x9,x7                       // comparo distancias con radio
    b.hi cont_crc                   // si a^2 + b^2 > r^2 => (a,b) ∉  a la imagen
	stur w10,[x0]				    // Colorear el pixel N
cont_crc:   
    add x0,x0,4                     // Siguiente pixel
	sub x1,x1,1                     // Decrementar contador X
	cbnz x1,loop0_crc               // Si no terminó la fila, salto
	sub x2,x2,1                     // Decrementar contador Y
	cbnz x2,loop1_crc               // Si no es la última fila, salto  

    ldr lr,[sp]                     // pop from sp
    ldr x8,[sp,#8]                  // pop from sp
    ldr x9,[sp,#16]                 // pop from sp
    ldr x1,[sp,#24]                 // pop from sp 
    ldr x2,[sp,#32]                 // pop from sp
    ldr x0,[sp,#40]                 // pop from sp 

    add sp,sp,#48                   // free mem
    ret













.endif
