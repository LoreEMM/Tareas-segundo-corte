#!/bin/bash

# =============================================
# Cálculo de Velocidad en MRU
# =============================================

echo "=== Cálculo de velocidad (MRU) ==="

# Leer datos
primer_t=$(awk 'NR==2 {print $1}' datos_mru.txt)
primer_x=$(awk 'NR==2 {print $2}' datos_mru.txt)

ultimo_t=$(tail -n 1 datos_mru.txt | awk '{print $1}')
ultimo_x=$(tail -n 1 datos_mru.txt | awk '{print $2}')

echo "Punto inicial: t = $primer_t s, x = $primer_x m"
echo "Punto final:   t = $ultimo_t s, x = $ultimo_x m"

# Calcular velocidad usando la fórmula v = (x2 - x1) / (t2 - t1)
delta_t=$((ultimo_t - primer_t))
delta_x=$((ultimo_x - primer_x))

if [ $delta_t -eq 0 ]; then
    echo "Error: El tiempo no puede ser cero."
    exit 1
fi

# Usar awk para la división decimal
velocidad=$(awk "BEGIN {printf \"%.2f\", $delta_x / $delta_t}")

echo ""
echo "Velocidad calculada: $velocidad m/s"

# Guardar resultados
cat > velocidad.txt << EOF
Velocidad del móvil: $velocidad m/s
Fórmula: posición(t) = $primer_x + $velocidad × t
Datos usados: desde ($primer_t, $primer_x) hasta ($ultimo_t, $ultimo_x)
EOF

echo "Resultados guardados en velocidad.txt"