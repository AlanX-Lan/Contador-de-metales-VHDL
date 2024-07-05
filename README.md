# Proyecto: Contador de Metales en VHDL

## Descripción

Este proyecto implementa un contador de metales utilizando VHDL (VHSIC Hardware Description Language). El diseño está desarrollado y simulado en el entorno de desarrollo Altera Quartus. El objetivo del proyecto es contar la cantidad de metales detectados a traves de un Sensor Inductivo de Proximidad de Metales y mostrar el conteo en un display de 7 segmentos.

## Características

- **Detección de Metales**: Detecta la presencia de metales y aumenta el conteo.
- **Reinicio del Contador**: Posibilidad de reiniciar el contador a cero mediante una señal de reinicio.
- **Visualización en Display de 7 Segmentos**: Muestra el conteo actual en un display de 7 segmentos.
- **Rotación de Dígitos**: Control del dígito a mostrar en el display.

## Archivos Incluidos

- `contadormetales.vhd`: Archivo principal que contiene el código VHDL del diseño del contador de metales.

## Uso

Para usar este proyecto, sigue estos pasos:

1. **Abrir el Proyecto**: Abre el archivo `contadormetales.vhd` en el entorno de desarrollo Altera Quartus.
2. **Compilar**: Compila el diseño para asegurarte de que no haya errores.
3. **Asigna pines**: Usa las herramientas de Quartus para asignar los pines de los dispositivos de prueba.
4. **Programar**: Programa el diseño en el dispositivo y prueba la funcionalidad de detección y conteo de metales.
