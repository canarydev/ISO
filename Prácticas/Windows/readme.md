# Práctica Windows

Vista ya la creación de scripts (básicos), tanto en Batch como en PowerShell, además de la creación de usuarios y grupos es hora de ir desarrollando una serie de prácticas que nos permitirán administrar por completo un sistema operativo Windows (en este caso, Windows XP).

## Tarea 1 - 08/02/2022 📆:
- Crear una nueva máquina virtual utilizando la imagen de Windows XP proporcionada en clase, con dos discos duros virtuales 💽, uno de 10 Gb, otro de 2 Gb y 2Gb de RAM🐏.
 > Para instalar Windows usa esta clave: KV7RD-6TM6R-973D6-X3F4T-P4M93
- Utiliza las Guest-Adittions💿 para que puedas trabajar mejor.
- Elegir una empresa y utilizar la imagen corporativa de la misma para personalizar el SO.
 > En principio bastará con entrar en C:\Documents and Settings\All Users\Datos de programa\Microsoft\User Account Pictures, borrar todas las imágenes y colocar sólo las imágenes que queramos que puedan usar nuestros usuarios.
- Se deberán realizar los cambios necesarios para que al usuario se le cree el perfil utilizando la imagen de empresa, en la carpeta de usuario se incluyan algunos documentos de la empresa (pueden crearse PDF inventados), e inicien por defecto en la web de la empresa.
- Crear un usuario llamado Antonio con contraseña empleado1. Crear el grupo empleados y agregar a Antonio👨.
- Antonio sólo debe tener acceso a la máquina Lunes, Martes, Jueves y Viernes, de 16:00 a 22:00.
 > Nota: Como estamos usando Windows XP hay muchos programas que ya no ofrecen soporte. No podrás ni consultar internet, pero no te preocupes. Existen alternativas a Chrome, IExplorer o Mozilla que siguen funcionando para XP. **Utiliza Mypal🐱** como explorador y **PDFLitle✍️** como lector PDF.

## Tarea 2 - 10/02/2022 📆:
- Eliminar los elementos innecesarios del menú de inicio. Si puedes ocultar la carpeta Inicio sería ya para nota (no deja borrarla el SO).
- Crear un directorio llamado Scripts en la carpeta de tu usuario administrador y añadirlo al path.
 > Para añadir una ruta al Path en Windows XP es sencillo. Tienes que hacer click derecho en Mi PC, darle a propiedades y a editar variables de entorno. Ahí verás una ventana parecida a esto:  
  ![](https://articles-images.sftcdn.net/wp-content/uploads/sites/2/2008/12/variableswin.png)  
  Si añades en las variables de usuario `Path    C:\"Documents and Settings"\Usuario\Scripts` tendrás incluída esta ruta al Path y podrás ejecutar tus Scripts desde cualquier lugar. Aprovecha la ocasión para crear alguna otra variable, como `Users    C:\"Documents and Settings"`, ya que te hará falta.
- Crear un script llamado **deleteUser.bat** que se guardará en la carpeta Scripts que has creado. Este script se invoca con **`deleteUser.bat usuario`** y tiene como cometido borrar al usuario y su carpeta personal.
> Voy a darte el código que puedes utilizar 😸 :  
  ```
  En construcción 🚧👷. Inténtalo tú primero, primoh!
  Esto se desbloqueará el 11/03/2022 
  ```
