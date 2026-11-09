INSTRUCCIONES: CORREGIR PERMISOS DE FUZZEL

Objetivo Hacer que el usuario juanes sea propietario de todos los
archivos y subcarpetas de ~/.config/fuzzel y pueda editarlos desde
Neovim sin usar sudo.

1.  Abre una terminal.

2.  Ejecuta estos comandos:

## sudo chown -R juanes:juanes ~/.config/fuzzel 
## chmod -R u+rwX ~/.config/fuzzel

3.  Abre el archivo de configuración con Neovim:

nvim ~/.config/fuzzel/fuzzel.ini

¿Qué hacen los comandos?

-   chown -R juanes:juanes: asigna a juanes la propiedad de la carpeta y
    de todo su contenido.
-   chmod -R u+rwX: concede al propietario permisos de lectura y
    escritura, y permisos de acceso a los directorios (y a los archivos
    que ya sean ejecutables).

Nota No es necesario abrir Neovim con sudo para editar estos archivos
una vez corregidos los permisos.
