# Transformador de imágenes de RGB a Escala de grises

Transformador hecho en C el cual transforma una imagen a escala de grises mediante la biblioteca OpenCV. Con el objetivo de agilizar el rendimiento, se desarrolló un procesador vectorial en Verilog. De esta manera, se puede seleccionar el porcentaje de procesamiento dispuesto para el programa principal en C, y el procentaje restante para que sea ejecutado por el procesador montado en una FPGA.
