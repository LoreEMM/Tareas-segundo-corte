# ==================== GRÁFICO MODIFICADO MRU ====================

reset

set terminal png size 900,600 enhanced font "Arial,12"
set output "grafico_modificado.png"

set title "MRU - Posición vs Tiempo con Recta de Ajuste (Modificado)"
set xlabel "Tiempo (s)"
set ylabel "Posición (m)"

set grid
set key top left

# Datos experimentales (nuevos)
plot "datos_mru.txt" using 1:2 with points pt 7 ps 1.8 lc rgb "blue" title "Datos experimentales", \
     3*x + 5 with lines lw 3 lc rgb "red" title "Recta de ajuste: posición(t) = 3t + 5 (v=3.00 m/s)"

print "Gráfico modificado generado correctamente"