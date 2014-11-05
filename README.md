# Servidor del proyecto Comunicador

Al utilizar la aplicación, esta enviará los datos que sumariza al servidor que se elija. Para poder visualizarlos, esta implementación cuenta con la capacidad de recibir los datos, analizarlos y mostrarlos como estadísticas al usuario.

La implementación está realizada en el lenguaje de programación Ruby, utilizando el Framework [Ruby on Rails](http://rubyonrails.org/).

# Instalación

Para poder utilizarlo, previamente se debe tener instalado y funcionando el lenguaje y el Framework.

### Rails

Para poder realizar la instalación de manera más sencilla, recomendamos el sitio [Rails Installer](http://railsinstaller.org), que permite instalar tanto Ruby como las distintas dependencias para hacer funcionar el servidor correctamente.

### Primeros pasos

Una vez que se posee el ambiente preparado, y solo la primera vez, se deben seguir los siguientes pasos:

1. Descargar el código del servidor en el directorio donde van a guardarlo (puede utilizarse el botón **Download ZIP** de Github).
2. Abrir una consola o terminal y posicionarse en el directorio del servidor (generalmente se realizará utilizando el comando cd).
3. Una vez ahí, correr el comando `bundle install` y esperar a que finalice.
4. Por último, correr el comando `rake db:migrate` y esperar a que finalice.

Una vez realizado todo esto, ya estamos en condiciones de hacer funcionar el servidor cuando lo necesitemos!

### Correr el servidor

Cada vez que lo deseemos, debemos ejecutar dos comandos (en instancias distintas de la consola o terminal) posicionados en la carpeta del servidor:

**Terminal 1**
````
$> rails s
````

**Terminal 2**
````
$> rackup private_pub.ru -s thin -E production
````

Eso permitirá que el servidor corra localmente en la computadora que se desee (por defecto, en el puerto 3000).

### Visualizar los datos

Para poder ver el panel de control que el servidor provee en el browser, con el servidor corriendo, se puede acceder a http://localhost:3000.
