.ifndef funciones_s
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
    del otro. Asi, los calculos de las otras esquinas es trivial. */

// --- EMPIEZA EL DIBUJO DE UN CUADRADO
// Parámetros:
// X3 - Coordenada x1 (inferior izquierdo)
// X4 - Coordenada y1 (inferior izquierdo)
// X5 - Coordenada x2 (superior derecho)
// X6 - Coordenada y2 (superior derecho)
// X7 - Color (ARGB)
dibujarCuadrado:
    mov x24, x3              // Guardar x1 en X24 
    mov x25, x4              // Guardar y1 en X25 
    mov x26, x5              // Guardar x2 en X26
    mov x27, x6              // Guardar y2 en X27

bucleFila:
    cmp x25, x27             // Comparar Y1 con Y2
    bgt finCuadrado          // Si Y1 > Y2, me pase en alto, entonces termine

    mov x1, x24              // Si aun estoy dentro del limite, reinicio x1 para la otra fila

bucleColumna:
    cmp x1, x26              // Comparar X1 con X2
    bgt siguienteFila        // Si X1 > X2, paso a la siguiente fila

    // Pintar el píxel actual
    mov x2, x25              // Poner y1 en X2 (coordenada y)
    bl dibujar_pixel        // Si estoy en una posicion valida (dentro de los limites) pinto dicho pixel

    // Siguiente columna
    add x1, x1, #1           // "x1++"
    b bucleColumna          // Repito para el proximo pixel (a la derecha del anterior)

siguienteFila:
    // Siguiente fila
    add x25, x25, #1         // "y1++"
    b bucleFila              // Repetir para la siguiente fila (subo un escaloncito)

finCuadrado:
    ret


.endif
