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






// Subrutina para dibujar una línea entre (X1, Y1) y (X2, Y2)
dibujar_linea:
loop1:
    // Compara si hemos llegado al punto final
    CMP X18, X20
    BEQ end_line
    CMP X19, X21
    BEQ end_line

    // Dibuja el pixel
    MOV X1, X18
    MOV X2, X19
    BL dibujar_pixel

    // Incrementa X e Y según sea necesario
    CMP X18, X20
    BLT sumoX
    CMP X19, X21
    BLT sumoY

sumoX:
    ADD X18, X18, #1
    B loop1
sumoY:
    ADD X19, X19, #1
    B loop1

end_line:
    RET







            // TRIANGULO IZQUIERDO




// Función para dibujar un triángulo rectángulo
// Entradas:
// x0 - Dirección base del framebuffer
// x1 - Coordenada x del vértice
// x2 - Coordenada y del vértice
// x3 - Base del triángulo
// x4 - Altura del triángulo
draw_triangleder:
    mov x5, 0            // Inicializar el contador de la altura
    mov x9, SCREEN_WIDTH // Cargar el ancho de la pantalla en x9




movz w18, #0x6300          // Parte baja del color (G y B)
movk w18, #0x2300, lsl 16  // Parte baja del color (R)








draw_triangle_loop_heightder:
    cmp x5, x4           // Comparar el contador de la altura con la altura del triángulo
    bge end_draw_triangleder // Si hemos alcanzado la altura, salir de la función

    mov x6, 0            // Inicializar el contador de la base
draw_triangle_loop_widthder:
    cmp x6, x5           // Comparar el contador de la base con el contador de la altura
    bgt end_draw_triangle_widthder // Si hemos alcanzado el contador de la altura, salir del bucle de ancho

    // Calcular la posición del píxel en el framebuffer
    add x7, x1, x6       // x7 = x1 + x6
    add x8, x2, x5       // x8 = x2 + x5
    mul x8, x8, x9       // x8 = (x2 + x5) * SCREEN_WIDTH
    add x7, x7, x8       // x7 = (x1 + x6) + (x2 + x5) * SCREEN_WIDTH
    lsl x7, x7, 2        // x7 = ((x1 + x6) + (x2 + x5) * SCREEN_WIDTH) * 4

    // Dibujar el píxel
    str w18, [x0, x7]

    add x6, x6, 1        // Incrementar el contador de la base
    b draw_triangle_loop_widthder

end_draw_triangle_widthder:
    add x5, x5, 1        // Incrementar el contador de la altura
    b draw_triangle_loop_heightder

end_draw_triangleder:
    ret


            // TRIANGULO DERECHO



draw_triangleizq:
    mov x5, 0            // Inicializar el contador de la altura
    mov x9, SCREEN_WIDTH // Cargar el ancho de la pantalla en x9




movz w18, #0x6300          // Parte baja del color (G y B)
movk w18, #0x2300, lsl 16  // Parte baja del color (R)






draw_triangle_loop_heightizq:
    cmp x5, x4           // Comparar el contador de la altura con la altura del triángulo
    bge end_draw_triangleizq // Si hemos alcanzado la altura, salir de la función

    mov x6, 0            // Inicializar el contador de la base
draw_triangle_loop_widthizq:
    cmp x6, x5           // Comparar el contador de la base con el contador de la altura
    bgt end_draw_triangle_widthizq // Si hemos alcanzado el contador de la altura, salir del bucle de ancho

    // Calcular la posición del píxel en el framebuffer
    sub x7, x1, x6       // x7 = x1 - x6
    add x8, x2, x5       // x8 = x2 + x5
    mul x8, x8, x9       // x8 = (x2 + x5) * SCREEN_WIDTH
    add x7, x7, x8       // x7 = (x1 - x6) + (x2 + x5) * SCREEN_WIDTH
    lsl x7, x7, 2        // x7 = ((x1 - x6) + (x2 + x5) * SCREEN_WIDTH) * 4

    // Dibujar el píxel
    str w18, [x0, x7]

    add x6, x6, 1        // Incrementar el contador de la base
    b draw_triangle_loop_widthizq

end_draw_triangle_widthizq:
    add x5, x5, 1        // Incrementar el contador de la altura
    b draw_triangle_loop_heightizq

end_draw_triangleizq:
    ret











.endif
