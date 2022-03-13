# Banana-pi-m2-zero-GPIO <img src="https://media.giphy.com/media/hvRJCLFzcasrR4ia7z/giphy.gif" width="25px"> 
#### Proyecto de configuración y uso de pin gpio en la placa Banana Pi M2 Zero

![BANANAPI-ZERO-01 (1)](https://user-images.githubusercontent.com/62630527/128290176-105ffebd-346a-4c38-8d4a-be466738a2ef.png)


## Hola soy Roxas

Creé este repositorio debido a la falta de información sobre el manejo GPIO con Bananapi m2 cero, así que mi propósito a través de esta pequeña guía es hacer la vida un poco más fácil en cuento a este tema.

## Tabla de contenidos

- [Instalación Rápida](#instalación-rápida-)
- [Instalación Manual](#instalación-manual-)
- [Uso de ejemplos](#uso-de-ejemplos)
- [Descarga de Imagenes](#descargas-)
- [Links y Video.](#espero-les-guste-y-sirva-este-pequeño-aporte-ademas-aqui-les-dejo-un-video-un-poco-mas-detallado-sobre-esto)
- [Referencias](#referencias)

## Instalación Rápida <img src="https://user-images.githubusercontent.com/62630527/158048706-9cb18a7c-c450-4d83-bf7d-d96cbc0ffd7d.png" width="25px"> 

Mediante la instalación rápida solo se tendrá que seleccionar su directorio una vez lo solicite                                                       (Ejemplo:/home/(su_directorio)).

Además de que se tendrá que tener en cuenta que la instalación tardara un poco y que tal vez tengan que ejecutar el script una segunda vez para evitar fallos que se hayan podido suscitar durante la instalación.

	sudo git clone https://github.com/TuryRx/Banana-pi-m2-zero-GPIO.git
	cd Bananapi-m2-zero-GPIO
	sudo chmod 777 -R Banana_Pi_M2Z_GPIO.sh
	sudo ./Banana_Pi_M2Z_GPIO.sh

## Instalación Manual <img src="https://user-images.githubusercontent.com/62630527/158048709-40521673-c4d2-41a1-86b4-c931c01f3c12.png" width="25px"> 

#### Comenzando tendremos que instalar los siguientes repositorios.

    sudo apt-get -y update
    sudo apt-get -y upgrade
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
    armbian-config \

#### Seguido esto vamos a descargar e instalar las librerías que utilizaremos con python3, dicho esto en este punto no instalaremos todas ya que existen algunas librerías que solo podremos instalar más adelante por falta de algunas dependencias que iremos resolviendo mediante avancemos con la instalación. 

    sudo python3 -m pip install --upgrade pip setuptools wheel
    sudo pip3 install Adafruit-Blinka
    sudo pip3 install smbus2
    sudo pip3 install pusherclient
    sudo pip3 install psutil
    sudo pip3 install tweepy
    sudo pip3 install feedparser
    sudo pip3 install subprocess.run
    sudo pip3 install vcgencmd

#### En este punto procederemos a ejecutar la descarga e instalación de las siguientes dependencias que utilizaremos en base a los siguientes repositorios.

    git clone https://github.com/adafruit/Adafruit_Python_GPIO.git
    cd Adafruit_Python_GPIO
    sudo python3 setup.py install
    cd

    git clone https://github.com/BPI-SINOVOIP/BPI-WiringPi2.git
    cd BPI-WiringPi2
    sudo ./build 
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

    git clone https://github.com/BPI-SINOVOIP/RPi.GPIO.git
    cd RPi.GPIO
    sudo python3 setup.py install
    cd

    git clone https://github.com/rm-hull/luma.examples.git
    cd luma.examples
    sudo -H pip install -e .
    cd

    git clone https://github.com/TuryRx/Bananapi-m2-zero-GPIO-files.git


#### Perfecto una vez terminado esto terminaremos con la instalación de las bibliotecas faltantes de python3.

    sudo pip3 install --upgrade ssd1306
    sudo pip3 install Adafruit-SSD1306
    sudo pip3 install adafruit-circuitpython-ssd1306
    sudo pip3 install --upgrade luma.oled


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

#### Ahora solo agregaremos a nuestro usuario a la lista i2c para poder trabajar con el bus de datos.

    sudo adduser (your user) i2c

#### Para terminar recuerda que también tendrás que habilitar las opciones i2c, wl-gpio con armbian-config, así también te dejaré los enlaces de mis imágenes de armbian que e compilado tanto de escritorio como de servidor con la capacidad de hacer overclock si se requiere.

    sudo armbian-config

####
![Captura de pantalla (162)](https://user-images.githubusercontent.com/62630527/128302899-fa6cbcb4-d1e3-4b8e-8d18-7f09b977fc90.png)
####
![Captura de pantalla (143)](https://user-images.githubusercontent.com/62630527/128293079-2cd62263-1e90-4949-b5a9-9230550df60b.png)
####
![Captura de pantalla (144)](https://user-images.githubusercontent.com/62630527/128293135-af583cce-9fe3-4f48-b71a-ab24ceff3a75.png)
####
![Captura de pantalla (145)](https://user-images.githubusercontent.com/62630527/128293154-3032c3c3-9f17-4ff1-913d-56012ba3de52.png)
####
![Captura de pantalla (146)](https://user-images.githubusercontent.com/62630527/128293175-557aca31-50dc-4637-a3d0-71c5de5278a8.png)
####
![Captura de pantalla (147)](https://user-images.githubusercontent.com/62630527/128293193-72e33041-f0e2-4968-8a41-365285fe30fc.png)

#### Espero les guste y sirva este pequeño aporte, ademas aqui les dejo un video un poco mas detallado sobre esto.

	▶️ Banana PI M2 Zero Configuracion y Uso de GPIO ✔️
	https://www.youtube.com/watch?v=LGlon4DOIwc&t=18s

#### Tambien les dejare el link de mi canal de youtube y los links de mis imagenes.

    TuryRx
    https://www.youtube.com/channel/UCsVnls-pcXUDKCafBRPJIsg

## Descargas <img src="https://user-images.githubusercontent.com/62630527/158044106-a52b6ef1-a65d-42d1-b376-79284df8721b.png" width="25px">

#### Ubuntu Focal Servidor 
    https://www.mediafire.com/file/8bbmt4ovp1np3l5/Armbian_21.08.0-trunk_Bananapim2zero_focal_current_5.10.52.img_26-07-2021_optifine.rar/file
#### Ubuntu Focal Servidor Minima
    https://www.mediafire.com/file/9mttmdoegw8nxeb/Armbian_21.11.0-trunk_Bananapim2zero_focal_current_5.10.75_minimal_05-11-2021.rar/file
#### Ubuntu Focal Escritorio xfce 
    https://www.mediafire.com/file/314d3jlg5xuiv2t/Armbian_21.08.0-trunk_Bananapim2zero_focal_current_5.10.52_xfce_desktop_26-07-2021_optifine.rar/file
#### Ubuntu Focal Escritorio i3wm
    https://www.mediafire.com/file/e2a3x1l21kri4ai/Armbian_21.11.0-trunk_Bananapim2zero_focal_current_5.10.75_i3-wm_desktop_05-11-2021.rar/file

### Uso de ejemplos

Puedes encontrar ejemplos para la pantalla oled en el directorio luma.examples/examples/ y un ejemplo para poder usar leds en Bananapi-m2-zero-GPIO-files/

### Ejemplo de uso de pantalla oled i2c

####
![Captura de pantalla (158)](https://user-images.githubusercontent.com/62630527/128301389-21afebe4-b82c-44b0-a1c0-3060e1c2a4d9.png)
####
![128302021-96c60a6c-ece6-4109-b3a1-a1b8c9d0955d](https://user-images.githubusercontent.com/62630527/158041860-7ac22c87-8d14-4949-b07c-3a01c07ea80c.jpg)
####
![128302087-cf29cb78-10c1-4c27-a41d-53d6d2185d88](https://user-images.githubusercontent.com/62630527/158041864-3a8d022d-a383-4bfd-9388-f67e715da29f.jpg)
####
####
####

### Ejemplo de uso de led

![Captura de pantalla (159)](https://user-images.githubusercontent.com/62630527/128301457-98cf0493-a483-4967-9e84-8e9d9e6dd709.png)
####
![128302140-6df6db0c-94c3-4736-a85d-50e8a1b16386](https://user-images.githubusercontent.com/62630527/158041884-8fbf1baf-6368-441c-843a-d5501e43b1b7.jpg)
####
####
####

### Ubicacion y funciones de pines fisicos

![1e2e5830e341ad050857fd65e18ea8e5680841ec](https://user-images.githubusercontent.com/62630527/128299639-437c126b-73d8-4a9d-8c36-1213c70cff20.jpg)
####
![Captura de pantalla (151)](https://user-images.githubusercontent.com/62630527/128299694-65b2f036-1649-4a10-b104-3c22de13d33f.png)
####
![Captura de pantalla (152)](https://user-images.githubusercontent.com/62630527/128299716-25ec4b3f-ff32-4af0-93fe-31d0ab6f5d7f.png)
####

## Referencias

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
    https://github.com/BPI-SINOVOIP/BPI-WiringPi2