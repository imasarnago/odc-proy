.ifndef funciones_s
.equ FUNCIONES_S, 0x000000

.include "framebuffer.s"


// NOTE 
// (x,y) esta en la direccion:   Dirección de inicio + 4 * [x + (y * 640)]  <--- FORMULA DADA EN CLASE
// fun dibujar_pixel(x,y,color) regs:(X1, X2, X7) desc: pixel en (x, y) del color color
// x0 contiene la direccion base del framebuffer
             // --- HECHA POR IMANOL
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
// X3 - Coordenada X1 (inferior izquierdo)
// X4 - Coordenada Y1 (inferior izquierdo)
// X5 - Coordenada X2 (superior derecho)
// X6 - Coordenada Y2 (superior derecho)
// X7 - Color (ARGB)
dibujarCuadrado:
    mov x1, x3               // Guardar X1 (registro) en x1 (coord. horizontal)
    mov x2, x4               // Guardar Y1 (registro) en x2 (coord. vertical), etc...
    mov x8, x5               // Guardar X2 en x8
    mov x9, x6               // Guardar Y2 en x9

bucleFila:
    cmp x2, x9               // Comparar Y1 con Y2
    bgt finCuadrado          // Si Y1 > Y2, terminar

    mov x1, x3               // Reiniciar X1 par a la nueva fila
bucleColumna:
    cmp x1, x8               // Comparar X1 con X2
    bgt siguienteFila        // Si X1 > X2 pasa a la siguiente fila

    // Pintar el píxel actual
    mov x10, x1              // Copiar X1 a x10
    mov x11, x2              // Copiar Y1 a x11
    bl dibujar_pixel         // Llamar a dibujar_pixel

    // Siguiente columna
    add x1, x1, #1           // "X1++" 
    b bucleColumna           // Repetir para la siguiente col.

siguienteFila:
    // Siguiente fila
    add x2, x2, #1           // Y1++
    b bucleFila              // Repetir para la siguiente fila

finCuadrado:
    ret

/* // 
// NOTE Set 2
@ (300,282)   - OBJ1  (con esto uso 
@ (303,275)   - OBJ1   4 registros)

// NOTE Info 2
@ 300,282,303,275 - 4 NUMEROS DISTINTOS

// --- FINALIZA EL DIBUJO DEL CUADRADO

 */




.endif
