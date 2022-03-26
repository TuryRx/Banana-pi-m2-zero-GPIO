# Banana-pi-m2-zero-GPIO <img src="https://media.giphy.com/media/hvRJCLFzcasrR4ia7z/giphy.gif" width="25px"> 

<img src="https://user-images.githubusercontent.com/62630527/160232659-95dd9d5a-aab8-4c9d-aada-07f9f4710b47.svg"> <img src="https://user-images.githubusercontent.com/62630527/160232639-911700a0-e6a5-451c-acd3-b546aaaee840.svg"> <img src="https://user-images.githubusercontent.com/62630527/160232603-39fd27c9-d257-471e-a773-0af8999e130a.svg">

#### gpio pin configuration and use project on Bananapi m2 zero board

![BANANAPI-ZERO-01 (1)](https://user-images.githubusercontent.com/62630527/128290176-105ffebd-346a-4c38-8d4a-be466738a2ef.png)


## Hi i'm roxas

I created this repo due to the lack of practical information for managing GPIOs with Bananapi m2 zero, so through this small guide I proposed to make life easier for them with this topic.

## Tabla de contenidos

- [Quick Install](#quick-install-)
- [Installation Manual](#installation-manual-)
- [Enable GPIO e I2C](#enable-gpio)
- [Usage examples](#usage-examples)
- [Download Images](#downloads-)
- [Links and Video.](#i-hope-you-like-and-serve-this-little-contribution-besides-here-i-leave-a-video-a-little-more-detail-about-it)
- [References](#references)

## Quick Install <img src="https://user-images.githubusercontent.com/62630527/158048706-9cb18a7c-c450-4d83-bf7d-d96cbc0ffd7d.png" width="25px"> 

With the Quick installation you will only have to select your directory once requested (Example:/home/(your_directory)).

In addition to that you will have to take into account that the installation will take a while and that you may have to run the script a second time to avoid errors that may have arisen during the installation.

    sudo git clone https://github.com/TuryRx/Banana-pi-m2-zero-GPIO.git
    cd Banana-pi-m2-zero-GPIO
    sudo chmod 777 -R Banana_Pi_M2Z_GPIO.sh
    sudo ./Banana_Pi_M2Z_GPIO.sh

To finish now it only remains to enable GPIO and I2C

#### Note: Image already configured for any SD capacity in download section

| User | Pass |
| ------------- | ------------- |
| **roxas** | pi  |
| **root**  | pi  |

## Installation Manual <img src="https://user-images.githubusercontent.com/62630527/158048709-40521673-c4d2-41a1-86b4-c931c01f3c12.png" width="25px">

#### Starting we will have to install the following repositories.

    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository -y universe
    sudo add-apt-repository -y multiverse
    sudo add-apt-repository -y restricted

#### Then we will perform a small update to the system.

    sudo apt-get update -y
    sudo apt-get upgrade -y

#### Once this is done, we will proceed to the installation of the packages that we will need to be able to use the libraries and dependencies that we will see later.

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
    armbian-config

#### Followed by this we will download and install the libraries that will be used with python3 to which at this point we will not install all that will be done after the download of dependencies that we need.

    sudo pip install setuptools==58.3.0
    sudo pip install wheel==0.37.0
    sudo pip3 install pyserial==3.5
    sudo pip3 install pyusb==1.2.1
    sudo pip3 install pyftdi==0.53.3
    sudo pip3 install Adafruit-PureIO==1.1.9
    sudo pip3 install Adafruit-PlatformDetect==3.17.1
    sudo pip3 install Adafruit-Blinka==6.15.0
    sudo pip3 install smbus2==0.4.1
    sudo pip3 install pusherclient==0.3.0
    sudo pip3 install psutil==5.8.0
    sudo pip3 install oauthlib==3.1.1
    sudo pip3 install requests-oauthlib==1.3.0
    sudo pip3 install tweepy==4.2.0
    sudo pip3 install sgmllib3k==1.0.0
    sudo pip3 install feedparser==6.0.8
    sudo pip3 install subprocess.run==0.0.8
    sudo pip3 install vcgencmd==0.1.1

#### At this point we will proceed to execute the download of the dependencies that we will use based on the following repositories in addition to executing them.

    git clone https://github.com/adafruit/Adafruit_Python_GPIO.git
    cd Adafruit_Python_GPIO
    sudo python3 setup.py install
    cd

    git clone https://github.com/BPI-SINOVOIP/BPI-WiringPi2.git
    cd BPI-WiringPi2
    sudo chmod 777 build
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

    git clone https://github.com/BPI-SINOVOIP/RPi.GPIO.git
    cd RPi.GPIO
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


#### Perfect once this is finished we will finish with the installation of the missing python3 libraries.

    sudo pip3 install Adafruit-SSD1306==1.6.2
    sudo pip3 install ssd1306==0.2.0
    sudo pip3 install adafruit-circuitpython-busdevice==5.1.0
    sudo pip3 install adafruit-circuitpython-framebuf==1.4.7
    sudo pip3 install adafruit-circuitpython-ssd1306==2.12.2
    sudo pip3 install luma.oled==3.8.1


#### Now we go to the Banana-Pi-m2-zero-GPIO-files folder and copy the files to the following directories in order to enable the use of the GPIO pins.

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

#### Well now that we have copied the files to our system we only have to change a few things within one of them so that we can establish the model of our banana pi m2 zero.

    sudo nano /var/lib/bananapi/board.sh

#### Change

    BOARD=bpi-m3
    BOARD_AUTO=bpi-m3
    BOARD_OLD=bpi-m64

#### For

    BOARD=bpi-m2z
    BOARD_AUTO=bpi-m2z
    BOARD_OLD=bpi-m64

#### Now we will only add our user to the i2c list to be able to work with the data bus.

    sudo adduser (your user) i2c

## Enable GPIO

#### to finish remember that you will also have to enable the i2c, wl-gpio options in the armbian configuration world as well as I will leave you the links of my armbian images to build both the desktop and server with the ability to do overclock if required.

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

#### I hope you like and serve this little contribution, besides here I leave a video a little more detail about it.

    ▶️ Banana PI M2 Zero Configuracion y Uso de GPIO ✔️
    https://www.youtube.com/watch?v=LGlon4DOIwc&t=18s

#### I will also leave a link to my youtube channel and the links to my images.

    TuryRx
    https://www.youtube.com/channel/UCsVnls-pcXUDKCafBRPJIsg

## Downloads <img src="https://user-images.githubusercontent.com/62630527/158044106-a52b6ef1-a65d-42d1-b376-79284df8721b.png" width="25px">

#### Focal ubuntu based server image
    https://www.mediafire.com/file/8bbmt4ovp1np3l5/Armbian_21.08.0-trunk_Bananapim2zero_focal_current_5.10.52.img_26-07-2021_optifine.rar/file
#### Focal ubuntu based server minimal image
    https://www.mediafire.com/file/9mttmdoegw8nxeb/Armbian_21.11.0-trunk_Bananapim2zero_focal_current_5.10.75_minimal_05-11-2021.rar/file
#### Focal ubuntu based xfce desktop image
    https://www.mediafire.com/file/314d3jlg5xuiv2t/Armbian_21.08.0-trunk_Bananapim2zero_focal_current_5.10.52_xfce_desktop_26-07-2021_optifine.rar/file
#### Focal ubuntu based i3wm desktop image
    https://www.mediafire.com/file/e2a3x1l21kri4ai/Armbian_21.11.0-trunk_Bananapim2zero_focal_current_5.10.75_i3-wm_desktop_05-11-2021.rar/file
#### Ubuntu Focal GPIO configured

### Usage examples

You can find examples for the oled screen in the directory luma.examples / examples / and an example to be able to use leds in Bananapi-m2-zero-GPIO-files /

### i2c OLED display example

####
![Captura de pantalla (158)](https://user-images.githubusercontent.com/62630527/128301389-21afebe4-b82c-44b0-a1c0-3060e1c2a4d9.png)
####
![128302021-96c60a6c-ece6-4109-b3a1-a1b8c9d0955d](https://user-images.githubusercontent.com/62630527/158041860-7ac22c87-8d14-4949-b07c-3a01c07ea80c.jpg)
####
![128302087-cf29cb78-10c1-4c27-a41d-53d6d2185d88](https://user-images.githubusercontent.com/62630527/158041864-3a8d022d-a383-4bfd-9388-f67e715da29f.jpg)
####
####
####

### Example for use of led 

![Captura de pantalla (159)](https://user-images.githubusercontent.com/62630527/128301457-98cf0493-a483-4967-9e84-8e9d9e6dd709.png)
####
![128302140-6df6db0c-94c3-4736-a85d-50e8a1b16386](https://user-images.githubusercontent.com/62630527/158041884-8fbf1baf-6368-441c-843a-d5501e43b1b7.jpg)
####
####
####

### Location and function of physical gpio pins

![1e2e5830e341ad050857fd65e18ea8e5680841ec](https://user-images.githubusercontent.com/62630527/128299639-437c126b-73d8-4a9d-8c36-1213c70cff20.jpg)
####
![Captura de pantalla (151)](https://user-images.githubusercontent.com/62630527/128299694-65b2f036-1649-4a10-b104-3c22de13d33f.png)
####
![Captura de pantalla (152)](https://user-images.githubusercontent.com/62630527/128299716-25ec4b3f-ff32-4af0-93fe-31d0ab6f5d7f.png)
####

### References

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