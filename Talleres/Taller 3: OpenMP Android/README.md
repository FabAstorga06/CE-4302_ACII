# PI ANDROID

Para compilar todos los programas, se necesita instalar previamente la herramienta Android NDK, en este caso se utiliza la versión 17. Dentro de cada directorio de cada ejercicio se encuentra una carpeta  `jni`. Ubíquese en esta y si desea compilar y ejecutar, siga leyendo.

### Compilación

Para compilar el programa, ejecute el siguiente comando:

```
/opt/android-ndk-r17/ndk-build
```

Se debe generar dos carpetas en el directorio padre, las cuales son `libs` y `obj`.

### Enviar aplicación a dispositivo

Para enviar la aplicación generada en la compilación, ejecute el siguiente comando:
```
adb push ../libs/armeabi-v7a/[ejecutable] /data/local/tmp
```

Cabe resaltar que, para que se logre enviar correctamente la aplicación al dispositivo, antes deberá poner este en modo "USB Debugging".

### Ejecución 

Para ejecutar el programa, ejecute el siguiente comando: 
```
adb shell /data/local/tmp/[ejecutable] [parámetros]
```