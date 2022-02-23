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
- Comprueba que tienes acceso a la máquina con el usuario Antonio y que te ha creado su carpeta de usuario en `C:\Documents and Settings"`.
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
@echo off
if [%1]==[] goto insertUser
set user=%1
goto deleteConfirmation

:insertUser
set /P user="Indique el nombre de usuario que desea eliminar: "
if [%user%]==[] goto end

:deleteConfirmation
echo Va a eliminar al usuario %user%. ¨Est  seguro?
set /P confirmation="Pulse S para continuar u otra tecla para cancelar: "
if %confirmation%==s goto deleting
if %confirmation%==S goto deleting

echo Borrado cancelado.
goto end

:deleting
echo.
echo Borrando %users%\%user%.
echo.
del /F/Q/S %users%\%user% > nul
rmdir /Q/S %users%\%user%
net user %user% /delete

:end
  ```
## Tarea 3 - 14/02/2022 📆:
- Utiliza el script anterior para borrar a Antonio y comprueba que se ha realizado correctamente.
- Crea cuatro usuarios desde el entorno gráfico, llamados Aday, Yeray, Yaiza y Xiomara.
- Aday deberá cambiar su contraseña con su primer inicio de sesión (ponle empleado1) y su cuenta nunca caducará.
- Yeray tendrá ya puesta su contraseña (empleado2), aunque podrá cambiarla si quiere y su cuenta caducará dentro de dos semanas (28/02/2022).
- Cambiar la contraseña de Yeray a través del administrador de equipos y ponerle empleado1.
- Poner a Yaiza la contraseña empleado1 y no permitirle cambiar su contraseña.
- Xiomara tendrá contraseña empleado1 y sólo debe tener acceso a la máquina Lunes, Martes, Jueves y Viernes, de 16:00 a 22:00.
- Crear dos grupos, que sean significativos para tu empresa, por ejemplo, taller y ventas.
- Mete a Aday en ambos grupos y bórralo de cualquier otro, incluído el de usuarios.
- Mete a Yeray en uno de los grupos y a Yaiza y a Xiomara en el otro grupo. Tanto a Yeray como a Yaiza y Xiomara deberás sacarlos de todos los otros grupos en los que estén.
> Has hecho muchas cosas es tiempo de un café ☕
- Comprueba que Yaiza no puede cambiar su contraseña.
- Establece directivas de contraseña. Las contraseñas tienen que cumplir requisitos de complejidad, se deben recordar al menos las 2 últimas contraseñas. Inicia sesión con cualquiera de los usuarios y comprueba que todas las limitaciones se cumplen.
- Las contraseñas que caduquen lo harán cada 15 días.
- No se puede cambiar de contraseña antes de que hayan transcurrido 2 días desde el último cambio.

## Tarea 4 - 18/02/2022 📆:
Es el momento de que muestres de qué eres capaz. Debes desprenderte de esos usuarios que te han estado acompañando durante largo tiempo (o no) Tienes que borrar a todos los usuarios que has creado; Antonio, Yeray, Yaiza y Xiomara, usando el script que tienes más arriba, el de `deleteUser.bat`:skull_and_crossbones:. 
**Una vez los hayas eliminado a todos**, comienza esta nueva tarea. 
### Creando `addusers.bat`:
Debes de crear un script llamado `addusers.bat`, el cual hará lo siguiente:
- En caso de no existir, creará un fichero en la carpeta Scripts llamado `users.csv`, cuya cabecera será `alias*fullname*password*expires*passwordChg*times*groups`. En caso de que ya existiese `users.csv`pero no contenga nada, se deberá añadir la cabecera mencionada antes.
- Se pedirá al usuario por pantalla que introduzca un alias, un nombre completo, una contraseña, si existe fecha de expiración de la cuenta, si el usuario puede cambiar de contraseña, si tiene limitaciones horarias y los grupos a los que pertenecerá el usuario.
- El **alias** es **obligatorio**, si no se introduce ningún alias, **debe de volver a pedirlo** nuevamente.
- El **nombre completo** es **opcional** y si no se introduce ninguno, se añadirá un **espacio en blanco**.
- La **contraseña** es **opcional**. Si no se introduce ninguna contraseña el valor por defecto será **Random**.
- La **fecha de expiración** es opcional. Si no se introduce ninguna fecha el valor por defecto será **Never**.
- Permitir el **cambio de contraseña** es **opcional**. Si no se introduce nada el valor por defecto será **Yes**.
- La **limitación horaria** es **opcional**. Si no se introduce ninguna limitación el valor por defecto será **All**.
- Los **grupos** son **opcionales**. Deben ir **separados por comas**.
- Debes preguntar si se desea añadir un nuevo usuario y si no, terminar.
- Probar que funciona utilizando personajes de Star Wars. Si no conoces ningún personaje investiga por internet 👊.
> Ten cuidado, borra todas las variables justo antes de preguntar si se desea añadir un nuevo usuario, si no, si no introduces nada podrías copiar el contenido del usuario anterior para esa variable.

## Tarea 5 - 22/02/2022 📆:
Ahora debes dar el paso definitivo (hacia el abismo no, hacia delante) para convertirte en un crack de la administración de usuarios. Debes de crear un nuevo script llamado `createUsers.bat`, el cual se encargará de crear a los usuarios que hemos añadido en el fichero `users.csv`, atendiendo a los valores que hemos almacenado para cada uno de ellos.
> Aquí no hay limitaciones, sólo que lo hagas bien. Para ello te daré algunos consejos.
> Mírate lo que he ido poniendo en la wiki. Casi todo está ahí (el 90%).
> No intentes hacerlo todo de golpe. Es mejor ir pasito a pasito. 1º crear el usuario, 2º añadir una fecha de expiración...
> Si consigues crear los grupos a la vez que se ejecuta este script te daré una buena calificación.
> Si consigues guardar sólo las frases `La contraseña para Leia es: 3Y80@Dqz`, sin que guarde espacios en blanco u otras frases, te daré una calificación extraordinaria.
