# Banana-pi-m2-zero-GPIO <img src="https://media.giphy.com/media/hvRJCLFzcasrR4ia7z/giphy.gif" width="25px" height="25px"> 

<img src="https://user-images.githubusercontent.com/62630527/160232659-95dd9d5a-aab8-4c9d-aada-07f9f4710b47.svg"> <img src="https://user-images.githubusercontent.com/62630527/160232639-911700a0-e6a5-451c-acd3-b546aaaee840.svg"> <img src="https://user-images.githubusercontent.com/62630527/160232603-39fd27c9-d257-471e-a773-0af8999e130a.svg">

#### gpio pin configuration and use project on Bananapi m2 zero board

![BANANAPI-ZERO-01 (1)](https://user-images.githubusercontent.com/62630527/128290176-105ffebd-346a-4c38-8d4a-be466738a2ef.png)


## Hi i'm roxas

I created this repo due to the lack of practical information for managing GPIOs with Bananapi m2 zero, so through this small guide I proposed to make life easier for them with this topic.

## Tabla de contenidos

- [Quick Install](#quick-install-)
- [Installation Manual](#installation-manual-)
- [Enable GPIO (I2C,PWM,SPI,UART,OVERCLOCK)](#enable-gpio-)
- [Extend Swap](#expand-swap-)
- [Usage examples](#usage-examples-)
- [Links and Video.](#links-and-videos-)
- [Download Images](#downloads-)
- [References and Mentions](#references-and-mentions-)

## New features configuration and script v 1.4.9 <img src="https://user-images.githubusercontent.com/62630527/175873787-3455ffdd-ec83-48ef-89b8-fb01877ed8f9.png" width="25px" height="25px">

    -New gpio table with fixed pins (command: sudo gpioread) 
    -Increase swap memory to 1G automatic  
    -Detection of events in gpio pins corrected and functional
    -Implementation of corrected and functional use of pull up resistors 
    -Examples available and use of gpio pins (https://github.com/TuryRx/Bananapi-m2-zero-GPIO-files)

## Quick Install <img src="https://user-images.githubusercontent.com/62630527/158048706-9cb18a7c-c450-4d83-bf7d-d96cbc0ffd7d.png" width="25px"> 

With the Quick installation you will only have to select your directory once requested (Example:/home/(your_directory)).

In addition to that you will have to take into account that the installation will take a while and that you may have to run the script a second time to avoid errors that may have arisen during the installation.

    sudo git clone https://github.com/TuryRx/Banana-pi-m2-zero-GPIO.git
    cd Banana-pi-m2-zero-GPIO
    sudo chmod 777 -R Banana_Pi_M2Z_GPIO.sh
    sudo ./Banana_Pi_M2Z_GPIO.sh

To finish now it only remains to enable GPIO and I2C

#### Note: Image already configured for any SD capacity in download section <img src="https://user-images.githubusercontent.com/62630527/160257385-a5a4f05f-4ab1-48f6-ae7f-80caf7d8b347.png" width="25px"> 

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
    libgpiod2 \
    python3-libgpiod \
    gpiod \
    python3-all \
    python3-all-dev \
    debhelper \
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

### Old Library
    git clone https://github.com/BPI-SINOVOIP/RPi.GPIO.git
    cd RPi.GPIO
    sudo python3 setup.py install
    cd

### New Library
    git clone https://github.com/GrazerComputerClub/RPi.GPIO.git
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

#### We will also make the copy of the files for the new gpio pin table with the BMC correction that we will execute with the command (sudo gpioread)

    sudo mv gpioread.sh /usr/local/bin/gpioread
    sudo chmod o+x /usr/local/bin/gpioread
    sudo chmod 777 /usr/local/bin/gpioread
    
    sudo touch /var/lib/bananapi/gpio
    sudo chmod o+x /var/lib/bananapi/gpio
    sudo chmod 777 /var/lib/bananapi/gpio

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

#### And now we will proceed to copy the example files that I left for the use of the gpio.

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
	sudo chmod 777 sys_stats.py
	sudo mv sys_stats.py /home/$directory/luma.examples/examples/

#### Now we will only add our user to the i2c list to be able to work with the data bus.

    sudo adduser (your user) i2c

## Enable GPIO <img src="https://user-images.githubusercontent.com/62630527/160256271-0fc44f4d-ffac-4480-93c5-31cc1c7513f5.png" width="25px">

#### to finish remember that you will also have to enable the i2c, wl-gpio options in the armbian configuration world as well as I will leave you the links of my armbian images to build both the desktop and server with the ability to do overclock if required.

    sudo armbian-config

#### Also, here I will leave you some commands to be able to configure the pins from terminal, do not put parentheses when executing the command (Example: sudo gpio -1 mode 29 in).

| Usage | Command |
| ------------- | ------------- |
| **Change pin mode** | gpio -1 mode (Pin_Number) (State: in o out) |
| **Write pin status** | gpio -1 write (Pin_Number) (Mode: 1 o 0) |
| **Read pin status** | gpio -1 read (Pin_Number) |
| **Enable or Disable pull-up resistor** | gpio -1 mode (Pin_Number) (Mode: up o down) |

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

### Expand Swap <img src="https://user-images.githubusercontent.com/62630527/163094821-b5a44e52-c43a-4b3d-91c1-2f87c83369bd.png" width="25px"> 

When it comes to expanding the swap memory, it is recommended to leave by default only twice the current memory, this in the case of boards like this, even though you can set the one you want to use.

To increase the current memory to double just execute by default it will increase 245M.

    sudo chmod 777 swap_memori.sh
    sudo ./swap_memori.sh

To increase by another amount modify the line (sudo fallocate -l 245M) for the amount you want.

    sudo chmod 777 swap_memori.sh
    sudo sed -i 's/sudo fallocate -l 245M /sudo fallocate -l (Cantidad #M o #G) /g' swap_memori.sh
    sudo ./swap_memori.sh

### Usage examples <img src="https://user-images.githubusercontent.com/62630527/160256612-06e00bf6-ee81-4ea0-a317-7d42f3c6196c.png" width="25px">

You can find examples for the oled screen in the directory luma.examples / examples / and an example to be able to use leds and buttons in Bananapi-m2-zero-GPIO-files /

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

### Example button connection

![Captura de pantalla (436)](https://user-images.githubusercontent.com/62630527/160730409-b8420fa4-5265-4fd8-acde-5031f03a1b04.png)
####
####
####

![Captura de pantalla (408)](https://user-images.githubusercontent.com/62630527/160311378-fca7bf30-a2e6-4323-9046-05a65778cf68.png)
####
####
####

### Example button connection without resistor (must be configured as pull-down before using more info in section on enabling gpio Example: sudo gpio -1 mode 7 1)

![Captura de pantalla (434)](https://user-images.githubusercontent.com/62630527/160729236-67d90492-4282-43ff-a8da-c683fd63b33a.png)
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

## Links and Videos <img src="https://user-images.githubusercontent.com/62630527/160256696-ebce1c73-df12-431a-aae9-53e9dc312bbb.png" width="25px">

#### I hope you like and serve this small contribution, also here I leave two videos a little more detailed about this.

    ▶️ Banana PI M2 Zero Configuracion y Uso de GPIO ✔️
    https://www.youtube.com/watch?v=LGlon4DOIwc&t=18s
####
    ▶️ Banana PI M2 Zero GPIO Script ✔️🔥
    https://www.youtube.com/watch?v=yt4lLYp91zM
####
    ▶️ Banana PI M2 Zero Nuevas Imagesnes ✔️🔥
    https://www.youtube.com/watch?v=d5MLndnQ6w4&t=198s

#### I will also leave a link to my youtube channel and the links to my images.

    TuryRx
    https://www.youtube.com/channel/UCsVnls-pcXUDKCafBRPJIsg

## Downloads <img src="https://user-images.githubusercontent.com/62630527/158044106-a52b6ef1-a65d-42d1-b376-79284df8721b.png" width="25px">

## Old Images 26-07-21 <img src="https://user-images.githubusercontent.com/62630527/172993373-e48489ba-2b27-4de8-9504-a8119bb25a78.png" width="25px">

#### Focal ubuntu based server image
    https://www.mediafire.com/file/8bbmt4ovp1np3l5/Armbian_21.08.0-trunk_Bananapim2zero_focal_current_5.10.52.img_26-07-2021_optifine.rar/file
#### Focal ubuntu based server minimal image
    https://www.mediafire.com/file/9mttmdoegw8nxeb/Armbian_21.11.0-trunk_Bananapim2zero_focal_current_5.10.75_minimal_05-11-2021.rar/file
#### Focal ubuntu based xfce desktop image
    https://www.mediafire.com/file/314d3jlg5xuiv2t/Armbian_21.08.0-trunk_Bananapim2zero_focal_current_5.10.52_xfce_desktop_26-07-2021_optifine.rar/file
#### Focal ubuntu based i3wm desktop image
    https://www.mediafire.com/file/e2a3x1l21kri4ai/Armbian_21.11.0-trunk_Bananapim2zero_focal_current_5.10.75_i3-wm_desktop_05-11-2021.rar/file
#### Ubuntu Focal GPIO configured rev1.3 28-03-22
    https://www.mediafire.com/file/rt3ww2bvezotqsg/Banana_Pi_M2Z_GPIO_28_03_22.rar/file

## New Images 30-05-22 <img src="https://user-images.githubusercontent.com/62630527/172993439-9bfec90a-5cbb-46ad-85c2-bd3dd113c8ef.png" width="25px">

### Base Ubuntu Focal <img src="https://user-images.githubusercontent.com/62630527/172993496-2ac24566-8881-4862-a976-69f49d257cfc.png" width="25px">

#### Banana Pi M2 Zero Image Server 30-05-22
    https://www.mediafire.com/file/aiu27ozq1ka4dkf/Armbian_22.05.0-trunk_Bananapim2zero_focal_current_5.15.43_Server.rar/file

#### Banana Pi M2 Zero Image Server Minimal 30-05-22
    https://www.mediafire.com/file/f6winm4iyahc1y7/Armbian_22.05.0-trunk_Bananapim2zero_focal_current_5.15.43_Server_Minimal.rar/file

#### Banana Pi M2 Zero Image Desktop XFCE 30-05-22
    https://www.mediafire.com/file/navy5t401hzjgsi/Armbian_22.05.0-trunk_Bananapim2zero_focal_current_5.15.43_xfce_desktop.rar/file

### Base Ubuntu Jammy <img src="https://user-images.githubusercontent.com/62630527/172993533-1f865635-977b-4d7e-83e6-883e8bf1c9cb.png" width="25px">

#### Banana Pi M2 Zero Image Server 30-05-22
    https://www.mediafire.com/file/bp2kkoiaygoe3fs/Armbian_22.05.0-trunk_Bananapim2zero_jammy_current_5.15.43_Server.rar/file

#### Banana Pi M2 Zero Image Server Minimal 30-05-22
    https://www.mediafire.com/file/7pmaty8inxkbsc1/Armbian_22.05.0-trunk_Bananapim2zero_jammy_current_5.15.43_Server_Minimal.rar/file

### Base Debian Buster <img src="https://user-images.githubusercontent.com/62630527/172993606-923c9b2d-11a6-480f-8cd9-c342bc28c42d.png" width="25px">

#### Banana Pi M2 Zero Image Server 30-05-22
    https://www.mediafire.com/file/qquiv00mm8ago2a/Armbian_22.08.0-trunk_Bananapim2zero_buster_current_5.15.43_Server.rar/file

### Base Debian Bullseye <img src="https://user-images.githubusercontent.com/62630527/172993639-7163fab8-4268-4218-a267-a483b189e5ae.png" width="25px">

#### Banana Pi M2 Zero Image Server 30-05-22
    https://www.mediafire.com/file/ahqfobon44htbud/Armbian_22.08.0-trunk_Bananapim2zero_bullseye_current_5.15.43_Server.rar/file

### References and Mentions

### Mentions

#### Special thanks to bontango for help with pin failure with use of new library as well as help in use of UART communication

     https://www.lisy.dev/
     https://forum.banana-pi.org/u/bontango
     https://forum.banana-pi.org/t/configuration-and-use-of-gpio-bpi-m2-zero/13179/79

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
    https://github.com/GrazerComputerClub/RPi.GPIO
    https://github.com/BPI-SINOVOIP/BPI-WiringPi2