# Banana-pi-m2-zero-GPIO <img src="https://media.giphy.com/media/hvRJCLFzcasrR4ia7z/giphy.gif" width="25px" height="25px"> 

<img src="https://user-images.githubusercontent.com/62630527/160232659-95dd9d5a-aab8-4c9d-aada-07f9f4710b47.svg"> <img src="https://user-images.githubusercontent.com/62630527/160232639-911700a0-e6a5-451c-acd3-b546aaaee840.svg"> <img src="https://user-images.githubusercontent.com/62630527/160232603-39fd27c9-d257-471e-a773-0af8999e130a.svg">

#### Proyecto de configuración y uso de pin gpio en la placa Banana Pi M2 Zero

![BANANAPI-ZERO-01 (1)](https://user-images.githubusercontent.com/62630527/128290176-105ffebd-346a-4c38-8d4a-be466738a2ef.png)


## Hola soy Roxas

Creé este repositorio debido a la falta de información sobre el manejo GPIO con Bananapi m2 cero, así que mi propósito a través de esta pequeña guía es hacer la vida un poco más fácil en cuento a este tema.

<a href='https://ko-fi.com/turyrx' target='_blank'><img height='35' style='border:0px;height:40px;' src='https://az743702.vo.msecnd.net/cdn/kofi3.png?v=0' border='0' alt='Buy Me a Coffee at ko-fi.com' />

Hola a todos soy su amigo TuryRx el motivo de abrir este ko-if para con su apoyo seguir el desarrollo y mantenimiento de imágenes sobre banana pi, ya que es algo complicado generar imágenes e información sobre este tipo de placas de desarrollo y su apoyo me ayudaría mucho a seguir desarrollando no solo para esta placa si no para más así como darme apoyo para seguir compartiéndoles todo lo que pueda, de antemano les agradezco a todos los que me puedan apoyar y aunque no lo puedan hacer me alegra mucho que mi contenido les pueda servir.

## Tabla de contenidos

- [Instalación Rápida](#instalación-rápida-)
- [Instalación Manual](#instalación-manual-)
- [Habilitar GPIO (I2C,PWM,SPI,UART,OVERCLOCK)](#habilitar-gpio-)
- [Ampliar Swap](#ampliar-swap-)
- [Uso de ejemplos](#uso-de-ejemplos-)
- [Links y Video.](#links-y-videos-)
- [Descarga de Imagenes](#descargas-)
- [Referencias y Menciones](#referencias-y-menciones)

## Correcciones de configuración y script v 1.5.2 <img src="https://user-images.githubusercontent.com/62630527/175873787-3455ffdd-ec83-48ef-89b8-fb01877ed8f9.png" width="25px" height="25px">

    -Problema de instalación automática solucionado.
    -Problema con libreria oled solucionado.
    -Problema con el uso de la librería RPI.GPIO solucionado.
    -Problema con dependencias faltantes solucionado.

## Nuevas características configuración y script v 1.4.9.2 <img src="https://user-images.githubusercontent.com/62630527/175873787-3455ffdd-ec83-48ef-89b8-fb01877ed8f9.png" width="25px" height="25px">

    -Nueva tabla gpio con pines corregidos (comando: sudo gpioread)
    -Incremento de memoria swap a 1G automático 
    -Detección de eventos en pines gpio corregida y funcional   
    -Implementación de uso de resistencias pull up corregida y funcional   
    -Ejemplos disponibles y uso de pines gpio (https://github.com/TuryRx/Bananapi-m2-zero-GPIO-files)


## Instalación Rápida <img src="https://user-images.githubusercontent.com/62630527/158048706-9cb18a7c-c450-4d83-bf7d-d96cbc0ffd7d.png" width="25px"> 

Mediante la instalación rápida solo se tendrá que seleccionar su directorio una vez lo solicite                                                       (Ejemplo:/home/(su_directorio)).

Además de que se tendrá que tener en cuenta que la instalación tardara un poco y que tal vez tengan que ejecutar el script una segunda vez para evitar fallos que se hayan podido suscitar durante la instalación.

	sudo git clone https://github.com/TuryRx/Banana-pi-m2-zero-GPIO.git
	cd Banana-pi-m2-zero-GPIO
	sudo chmod 777 -R Banana_Pi_M2Z_GPIO.sh
	sudo ./Banana_Pi_M2Z_GPIO.sh

Para terminar ahora solo quedaria habilitar GPIO e I2C

#### Nota:Imagen ya configurada para cualquier capacidad de SD en seccion de descargas <img src="https://user-images.githubusercontent.com/62630527/160257385-a5a4f05f-4ab1-48f6-ae7f-80caf7d8b347.png" width="25px"> 

| Usuario | Contraseña |
| ------------- | ------------- |
| **roxas** | pi  |
| **root**  | pi  |

## Instalación Manual <img src="https://user-images.githubusercontent.com/62630527/158048709-40521673-c4d2-41a1-86b4-c931c01f3c12.png" width="25px"> 

#### Comenzando tendremos que instalar los siguientes repositorios.

    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository -y universe
    sudo add-apt-repository -y multiverse
    sudo add-apt-repository -y restricted

#### Luego realizaremos una actualización al sistema.

    sudo apt-get update -y
    sudo apt-get upgrade -y

#### Una vez hecho esto, procederemos a la instalación de los paquetes que necesitaremos para poder utilizar las bibliotecas y dependencias que utilizaremos más adelante.

    sudo apt-get install -y \
    inxi \
    git \
    build-essential \ 
    python3-pip \
    python3-dev \
    python3-smbus \ 
    i2c-tools \
    vsftpd \
    python3-pil \ 
    python3-setuptools \ 
    libfreetype6-dev \
    libjpeg8-dev \
    libsdl1.2-dev \
    libsdl-dev \
    libportmidi-dev \ 
    libsdl-ttf2.0-dev \ 
    libsdl-mixer1.2-dev \ 
    libsdl-image1.2-dev \
    libjpeg-dev \
    python-dev \
    lm-sensors \
    unrar \
    libgpiod2 \
    python3-libgpiod \
    gpiod \
    python3-all \
    python3-all-dev \
    debhelper \
    armbian-config

#### Seguido esto vamos a descargar e instalar las librerías que utilizaremos con python3, dicho esto en este punto no instalaremos todas ya que existen algunas librerías que solo podremos instalar más adelante por falta de algunas dependencias que iremos resolviendo mediante avancemos con la instalación. 

    sudo pip3 install setuptools==58.3.0
    sudo pip3 install wheel==0.37.0
    sudo pip3 install pyserial==3.5
    sudo pip3 install pyusb==1.2.1
    sudo pip3 install pyftdi==0.54.0
    sudo pip3 install Adafruit-PureIO==1.1.9
    sudo pip3 install Adafruit-PlatformDetect==3.22.0
    sudo pip3 install Adafruit-Blinka==7.1.1
    sudo pip3 install smbus2==0.4.1
    sudo pip3 install Deprecated==1.2.13
    sudo pip3 install Pillow==9.4.0
    sudo pip3 install RPi.GPIO==0.6.3
    sudo pip3 install spidev==3.5
    sudo pip3 install argcomplete==2.1.1
    sudo pip3 install wrapt==1.14.0
    sudo pip3 install pusherclient==0.3.0
    sudo pip3 install psutil==5.8.0
    sudo pip3 install oauthlib==3.1.1
    sudo pip3 install requests-oauthlib==1.3.0
    sudo pip3 install tweepy==4.2.0
    sudo pip3 install sgmllib3k==1.0.0
    sudo pip3 install feedparser==6.0.8
    sudo pip3 install subprocess.run==0.0.8
    sudo pip3 install vcgencmd==0.1.1

#### En este punto procederemos a ejecutar la descarga e instalación de las siguientes dependencias que utilizaremos en base a los siguientes repositorios.

    git clone https://github.com/adafruit/Adafruit_Python_GPIO.git
    cd Adafruit_Python_GPIO
    sudo python3 setup.py install
    cd

    git clone https://github.com/bontango/BPI-WiringPi2.git
    cd BPI-WiringPi2
    sudo chmod 777 build
    sudo ./build 
    cd

    git clone https://github.com/GrazerComputerClub/RPi.GPIO.git
    cd RPi.GPIO
    sudo python3 setup.py install
    cd

    git clone https://github.com/LeMaker/RPi.GPIO_BP -b bananapi
    cd RPi.GPIO_BP
    sudo python3 setup.py install
    cd

    git clone https://github.com/codelectron/ssd1306.git
    cd ssd1306
    sudo python3 setup.py install
    cd

    git clone https://github.com/rm-hull/luma.oled.git
    cd luma.oled
    sudo python3 setup.py install
    cd

    git clone https://github.com/rm-hull/luma.examples.git
    cd luma.examples
    sudo -H pip install -e .
    cd

    git clone https://github.com/TuryRx/Bananapi-m2-zero-GPIO-files.git

#### Antiguas Librerias

    git clone https://github.com/BPI-SINOVOIP/BPI-WiringPi2.git
    cd BPI-WiringPi2
    sudo chmod 777 build
    sudo ./build 
    cd

    git clone https://github.com/BPI-SINOVOIP/RPi.GPIO.git
    cd RPi.GPIO
    sudo python3 setup.py install
    cd


#### Perfecto una vez terminado esto terminaremos con la instalación de las bibliotecas faltantes de python3.

    sudo pip3 install Adafruit-SSD1306==1.6.2
    sudo pip3 install ssd1306==0.2.0
    sudo pip3 install adafruit-circuitpython-busdevice==5.1.0
    sudo pip3 install adafruit-circuitpython-framebuf==1.4.7
    sudo pip3 install adafruit-circuitpython-ssd1306==2.12.2
    sudo pip3 install cbor2==5.4.2
    sudo pip3 install luma.oled==3.8.1

#### Ahora iremos a la carpeta Banana-Pi-m2-zero-GPIO-files y copiaremos los archivos a los siguientes directorios para habilitar el uso de los pines GPIO.

    cd Bananapi-m2-zero-GPIO-files/bpi-servicee
    cd etc
    sudo cp -r * /etc

    cd ..

    cd usr
    sudo cp -r * /usr

    cd ..

    cd var
    sudo cp -r * /var

    cd ..

#### Igualmente realizaremos la copia de los archivos para la nueva tabla de pines gpio con la corrección de BMC que la ejecutaremos con el comando (sudo gpioread)

    sudo mv gpioread.sh /usr/local/bin/gpioread
    sudo chmod o+x /usr/local/bin/gpioread
    sudo chmod 777 /usr/local/bin/gpioread
    
    sudo touch /var/lib/bananapi/gpio
    sudo chmod o+x /var/lib/bananapi/gpio
    sudo chmod 777 /var/lib/bananapi/gpio

#### Bueno ahora que hemos copiado los archivos a nuestro sistema solo nos queda cambiar algunas cosas dentro de uno de ellos para que podamos establecer el modelo de nuestra banana pi m2 zero.

    sudo nano /var/lib/bananapi/board.sh

#### Cambiaremos

    BOARD=bpi-m3
    BOARD_AUTO=bpi-m3
    BOARD_OLD=bpi-m64

#### Por

    BOARD=bpi-m2z
    BOARD_AUTO=bpi-m2z
    BOARD_OLD=bpi-m64

#### Y ahora procederemos a copiar los archivos de ejemplo que les deje para el uso de los gpio.

	cd Bananapi-m2-zero-GPIO-files
	sudo chmod 777 led_m2z.py
	sudo mv led_m2z.py /home/$directory 
	sudo chmod 777 led_button_m2z.py
	sudo mv led_button_m2z.py /home/$directory 
	sudo chmod 777 button_state_m2z.py
	sudo mv button_state_m2z.py /home/$directory
	sudo chmod 777 button_event_m2z.py
	sudo mv button_event_m2z.py /home/$directory
	sudo chmod 777 gpio_funcion_m2z.py
	sudo mv gpio_funcion_m2z.py /home/$directory
	sudo chmod 777 info_board_m2z.py
	sudo mv info_board_m2z.py /home/$directory
	sudo chmod 777 info_gpio_m2z.py
	sudo mv info_gpio_m2z.py /home/$directory
	sudo chmod 777 pwm_m2z.py
	sudo mv pwm_m2z.py /home/$directory
    sudo chmod 777 button_pull_up_m2z.py
    sudo mv button_pull_up_m2z.py /home/$directory
    sudo chmod 777 gpio_read_pin_m2z.py
    sudo mv gpio_read_pin_m2z.py /home/$directory
    sudo chmod 777 button_event_rising_m2z.py
    sudo mv button_event_rising_m2z.py /home/$directory
	sudo chmod 777 sys_stats.py
	sudo mv sys_stats.py /home/$directory/luma.examples/examples/

#### Ahora solo agregaremos a nuestro usuario a la lista i2c para poder trabajar con el bus de datos.

    sudo adduser (your user) i2c

## Habilitar GPIO <img src="https://user-images.githubusercontent.com/62630527/160256271-0fc44f4d-ffac-4480-93c5-31cc1c7513f5.png" width="25px">

#### Para terminar recuerda que también tendrás que habilitar las opciones i2c, wl-gpio, pwm, cpu y uart con armbian-config, así también te dejaré los enlaces de mis imágenes de armbian que e compilado tanto de escritorio como de servidor con la capacidad de hacer overclock si se requiere.

    sudo armbian-config

#### Además, aquí les dejare unos comandos para poder configurar los pines desde terminal, no poner parentesis al ejecutar el comando (Ejemplo: sudo gpio -1 mode 29 in).

| Uso | Comando |
| ------------- | ------------- |
| **Cambiar modo de pin** | gpio -1 mode (Numero_de_Pin) (Estado: in o out) |
| **Escribir estado de pin** | gpio -1 write (Numero_de_Pin) (Modo: 1 o 0) |
| **Leer estado de pin** | gpio -1 read (Numero_de_Pin) |
| **Activar o Desactivar resistencia pull-up** | gpio -1 mode (Numero_de_Pin) (Modo: up o down) |

### Habilitación de pines gpio (I2C,PWM,SPI,UART,OVERCLOCK)

####
![1](https://user-images.githubusercontent.com/62630527/176098391-8aeb7341-da7b-4801-abf5-540abe3109dc.PNG)
####
![2](https://user-images.githubusercontent.com/62630527/176098464-dc6b2e99-87a9-49e1-a080-4e38984751db.PNG)
####
![3](https://user-images.githubusercontent.com/62630527/176098493-a1244f7d-3881-46b2-a092-42cf4af26443.PNG)
####
![4](https://user-images.githubusercontent.com/62630527/176098519-cb91dbd3-1c50-4102-8863-2c31f2e48843.PNG)
####
![5](https://user-images.githubusercontent.com/62630527/176098535-1e0e271e-efa2-4d2a-9b33-d79351db8bed.PNG)

### Ampliar Swap <img src="https://user-images.githubusercontent.com/62630527/163094821-b5a44e52-c43a-4b3d-91c1-2f87c83369bd.png" width="25px"> 

A la hora de ampliar la memoria de intercambio(swap), se recomienda dejar por defecto solo el doble de la memoria actual, esto en caso de placas como esta aun que se puede establecer la que uno desee utilizar. 

Para aumentar la memoria actual al doble solo ejecutar por defecto aumentara 735M para tener 1G.

    sudo chmod 777 swap_memori.sh
    sudo ./swap_memori.sh

Para aumentar por otra cantidad modificar la línea (sudo fallocate -l 735M) por la cantidad que quieran.

    sudo chmod 777 swap_memori.sh
    sudo sed -i 's/sudo fallocate -l 735M /sudo fallocate -l (Cantidad #M o #G) /g' swap_memori.sh
    sudo ./swap_memori.sh

### Uso de ejemplos <img src="https://user-images.githubusercontent.com/62630527/160256612-06e00bf6-ee81-4ea0-a317-7d42f3c6196c.png" width="25px">

Puedes encontrar ejemplos para la pantalla oled en el directorio /home/$user/gpio_files/luma.examples/examples/ y otros ejemplos sobre uso de leds, botones, eventos, pull_up, pwm, informacion de sistema y deteccion de eventos en el directorio /home/$user/gpio-examples/ 

### Tabla de pines gpio mediante terminal (sudo gpioread) <img src="https://user-images.githubusercontent.com/62630527/176109582-31f37087-5e49-415e-aadb-4efd5668edc0.png" width="25px">

![6](https://user-images.githubusercontent.com/62630527/176101146-0fb914c6-8f1c-4634-ba11-dbea3f15180f.PNG)
####

### Deteccion de direccion i2c de dispositivos (sudo i2cdetect -y 0)

![9](https://user-images.githubusercontent.com/62630527/176101171-2a72f677-3944-4753-aed8-9ed432dedb66.PNG)
####

### Ejemplos de uso de pantalla oled i2c <img src="https://user-images.githubusercontent.com/62630527/176109587-952627c0-96bc-4810-9dfd-1edb4637cfe5.png" width="25px">

![7](https://user-images.githubusercontent.com/62630527/176101345-bc48c74c-8161-4502-8d55-eb5802301307.PNG)
####
![oled](https://user-images.githubusercontent.com/62630527/176106171-b21df7ee-d24a-4f4d-8b7a-014cc82f2d80.jpg)
####

### Ejemplo informacion de sistema con pantalla oled i2c

![8](https://user-images.githubusercontent.com/62630527/176101491-75df82de-12f1-406d-aedb-c7f87fea6381.PNG)
####
![sys_info](https://user-images.githubusercontent.com/62630527/176106194-a8ac4df0-198f-464d-99b1-cd5483170b6f.jpg)
####

### Ejemplo de uso de led <img src="https://user-images.githubusercontent.com/62630527/176109620-94e3b427-783d-4274-a708-a76adf119844.png" width="25px">

![10](https://user-images.githubusercontent.com/62630527/176103746-0dbd4700-3456-4118-ae95-bdbda1e9a4ea.PNG)
####
![led](https://user-images.githubusercontent.com/62630527/176106154-f7822c22-77c9-4111-93a5-76cf7c97efd0.jpg)
####

### Ejemplo coneccion de boton pull_up <img src="https://user-images.githubusercontent.com/62630527/176109611-b8c7d04c-e54a-4009-9c40-371dbbda2126.png" width="25px">

![11](https://user-images.githubusercontent.com/62630527/176103757-7448a539-867d-430e-9bb1-27a20e619353.PNG)
####
![button](https://user-images.githubusercontent.com/62630527/176106138-65b30851-8ca3-4313-b3f3-d003d0803f18.jpg)
####

### Ubicacion y funciones de pines fisicos

![1e2e5830e341ad050857fd65e18ea8e5680841ec](https://user-images.githubusercontent.com/62630527/128299639-437c126b-73d8-4a9d-8c36-1213c70cff20.jpg)
####

## Links y Videos <img src="https://user-images.githubusercontent.com/62630527/160256696-ebce1c73-df12-431a-aae9-53e9dc312bbb.png" width="25px">

#### Espero les guste y sirva este pequeño aporte, ademas aqui les dejo dos videos un poco mas detallado sobre esto.

    ▶️ Banana PI M2 Zero Configuracion y Uso de GPIO ✔️
    https://www.youtube.com/watch?v=LGlon4DOIwc&t=18s
####
    ▶️ Banana PI M2 Zero GPIO Script ✔️🔥
    https://www.youtube.com/watch?v=yt4lLYp91zM
####
    ▶️ Banana PI M2 Zero Nuevas Imagesnes ✔️🔥
    https://www.youtube.com/watch?v=d5MLndnQ6w4&t=198s

#### Tambien les dejare el link de mi canal de youtube y los links de mis imagenes.

    ▶️ TuryRx 🔥
    https://www.youtube.com/channel/UC2qm0bsEO0u1wBgiINs8-5w

## Descargas <img src="https://user-images.githubusercontent.com/62630527/158044106-a52b6ef1-a65d-42d1-b376-79284df8721b.png" width="25px">

## Imagenes 18-02-23 <img src="https://user-images.githubusercontent.com/62630527/172993373-e48489ba-2b27-4de8-9504-a8119bb25a78.png" width="25px">

### Imagenes Antiguas

#### [Archivo de imágenes viejas Banana pi M2 Zero 2021-2022](https://github.com/TuryRx/Banana-pi-m2-zero-Images)

## Referencias y Menciones

### Menciones

#### Agradecimiento especial a bontango por ayuda con fallo de pines con uso de nueva librería ademadas de ayuda en uso de comunicación UART 

    https://www.lisy.dev/
    https://forum.banana-pi.org/u/bontango
    https://forum.banana-pi.org/t/configuracion-y-uso-de-gpio-bpi-m2-zero/13179/79

### Referencias

    https://github.com/adafruit/Adafruit_Python_GPIO
    https://github.com/adafruit/Adafruit_Python_SSD1306
    https://learn.adafruit.com/circuitpython-on-raspberrypi-linux/installing-circuitpython-on-raspberry-pi#enable-i2c-and-spi-3-5
    https://unipython.com/gpio-raspberry-pi-explicacion-uso-encender-led/
    https://github.com/codelectron/ssd1306
    https://github.com/PyAV-Org/PyAV/issues/491
    https://github.com/rm-hull/luma.oled/wiki/Usage-&-Benchmarking
    https://github.com/rm-hull/luma.examples
    https://luma-oled.readthedocs.io/en/latest/hardware.html
    https://github.com/rm-hull/luma.oled
    https://www.raspberrypi-spy.co.uk/2018/04/i2c-oled-display-module-with-raspberry-pi/
    https://stackoverflow.com/questions/47694421/pil-issue-oserror-cannot-open-resource
    https://github.com/adafruit/Adafruit_CircuitPython_SSD1306
    https://github.com/adafruit/Adafruit_Blinka
    https://ssd1306.readthedocs.io/en/latest/python-usage.html
    https://ssd1306.readthedocs.io/en/latest/index.html
    https://ssd1306.readthedocs.io/en/latest/intro.html
    https://programmerclick.com/article/48301644742/
    https://github.com/BPI-SINOVOIP/RPi.GPIO
    https://github.com/LeMaker/RPi.GPIO_BP/blob/bananapro/test/info_RPi.GPIO.py
    https://github.com/GrazerComputerClub/RPi.GPIO
    https://github.com/BPI-SINOVOIP/BPI-WiringPi2