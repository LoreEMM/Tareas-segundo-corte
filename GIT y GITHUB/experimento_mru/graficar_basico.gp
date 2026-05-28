# ==================== GRÁFICO BÁSICO MRU ====================

reset # Limpiar configuraciones anteriores

# Configuración del terminal (salida PNG)
set terminal png size 900,600 enhanced font "Arial,12"

# Nombre del archivo de salida
set output "grafico_basico.png"

# Título y etiquetas
set title "MRU - Posición vs Tiempo (Datos Experimentales)"
set xlabel "Tiempo (s)"
set ylabel "Posición (m)"

# Estilo del gráfico
set grid
#set keep top left

# Graficar los puntos
plot "datos_mru.txt" using 1:2 with points pt 7 ps 1.8 lc rgb "blue" title "Datos experimentales"

print "Gráfico básico generado correctamente: grafico_basico.png"
