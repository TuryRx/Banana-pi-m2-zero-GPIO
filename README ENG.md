# Banana-pi-m2-zero-GPIO <img src="https://media.giphy.com/media/hvRJCLFzcasrR4ia7z/giphy.gif" width="25px" height="25px"> 

<img src="https://user-images.githubusercontent.com/62630527/160232659-95dd9d5a-aab8-4c9d-aada-07f9f4710b47.svg"> <img src="https://user-images.githubusercontent.com/62630527/160232639-911700a0-e6a5-451c-acd3-b546aaaee840.svg"> <img src="https://user-images.githubusercontent.com/62630527/160232603-39fd27c9-d257-471e-a773-0af8999e130a.svg">

#### gpio pin configuration and use project on Bananapi m2 zero board

![BANANAPI-ZERO-01 (1)](https://user-images.githubusercontent.com/62630527/128290176-105ffebd-346a-4c38-8d4a-be466738a2ef.png)


## Hi i'm roxas 

I created this repo due to the lack of practical information for managing GPIOs with Bananapi m2 zero, so through this small guide I proposed to make life easier for them with this topic.

<a href='https://ko-fi.com/turyrx' target='_blank'><img height='35' style='border:0px;height:40px;' src='https://az743702.vo.msecnd.net/cdn/kofi3.png?v=0' border='0' alt='Buy Me a Coffee at ko-fi.com' />

Hello everyone, I am your friend TuryRx, the reason for opening this ko-if is to continue the development and maintenance of images on banana pi with your support, since it is somewhat complicated to generate images and information on this type of development boards and your support helped me It would help a lot to continue developing not only for this board but for more as well as give me support to continue sharing everything I can, I thank everyone who can support me in advance and even if they can't do it, I'm very happy that my content can serve

## Tabla de contenidos

- [Quick Install](#quick-install-)
- [Installation Manual](#installation-manual-)
- [Enable GPIO (I2C,PWM,SPI,UART,OVERCLOCK)](#enable-gpio-)
- [Extend Swap](#expand-swap-)
- [Usage examples](#usage-examples-)
- [Links and Video.](#links-and-videos-)
- [Download Images](#downloads-)
- [References and Mentions](#references-and-mentions)

## Configuration and script fixes v 1.6.1 <img src="https://user-images.githubusercontent.com/62630527/175873787-3455ffdd-ec83-48ef-89b8-fb01877ed8f9.png" width="25px" height ="25px">

-Problem with Ethernet port fixed.
	 -problem with oled library solved.
     -Problem with the use of RPI.GPIO libraries Fixed.
     -Problem with library versions fixed.
	 -Problem with gpio table fixed.

## Configuration and script fixes v 1.5.2 <img src="https://user-images.githubusercontent.com/62630527/175873787-3455ffdd-ec83-48ef-89b8-fb01877ed8f9.png" width="25px" height ="25px">

     -Automatic installation problem fixed.
     -Problem with oled library solved.
     -Problem with the use of the RPI.GPIO library fixed.
     -Problem with missing dependencies fixed.

## New features configuration and script v 1.4.9.2 <img src="https://user-images.githubusercontent.com/62630527/175873787-3455ffdd-ec83-48ef-89b8-fb01877ed8f9.png" width="25px" height="25px">

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

#### At this point we will proceed to execute the download of the dependencies that we will use based on the following repositories in addition to executing them.

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

### Old Libraries

    git clone https://github.com/BPI-SINOVOIP/BPI-WiringPi2.git
    cd BPI-WiringPi2
    sudo chmod 777 build
    sudo ./build 
    cd

    git clone https://github.com/BPI-SINOVOIP/RPi.GPIO.git
    cd RPi.GPIO
    sudo python3 setup.py install
    cd






#### Perfect once this is finished we will finish with the installation of the missing python3 libraries.

    sudo pip3 install Adafruit-SSD1306==1.6.2
    sudo pip3 install ssd1306==0.2.0
    sudo pip3 install adafruit-circuitpython-busdevice==5.1.0
    sudo pip3 install adafruit-circuitpython-framebuf==1.4.7
    sudo pip3 install adafruit-circuitpython-ssd1306==2.12.2
    sudo pip3 install cbor2==5.4.2
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
    sudo chmod 777 button_pull_up_m2z.py
    sudo mv button_pull_up_m2z.py /home/$directory
    sudo chmod 777 gpio_read_pin_m2z.py
    sudo mv gpio_read_pin_m2z.py /home/$directory
    sudo chmod 777 button_event_rising_m2z.py
    sudo mv button_event_rising_m2z.py /home/$directory
	sudo chmod 777 sys_stats.py
	sudo mv sys_stats.py /home/$directory/luma.examples/examples/

#### Now we will only add our user to the i2c list to be able to work with the data bus.

    sudo adduser (your user) i2c

## Enable GPIO <img src="https://user-images.githubusercontent.com/62630527/160256271-0fc44f4d-ffac-4480-93c5-31cc1c7513f5.png" width="25px">

#### to finish remember that you will also have to enable the i2c, wl-gpio, pwm, cpu y uart options in the armbian configuration world as well as I will leave you the links of my armbian images to build both the desktop and server with the ability to do overclock if required.

    sudo armbian-config

#### Also, here I will leave you some commands to be able to configure the pins from terminal, do not put parentheses when executing the command (Example: sudo gpio -1 mode 29 in).

| Usage | Command |
| ------------- | ------------- |
| **Change pin mode** | gpio -1 mode (Pin_Number) (State: in o out) |
| **Write pin status** | gpio -1 write (Pin_Number) (Mode: 1 o 0) |
| **Read pin status** | gpio -1 read (Pin_Number) |
| **Enable or Disable pull-up resistor** | gpio -1 mode (Pin_Number) (Mode: up o down) |

### Enabling gpio pins (I2C,PWM,SPI,UART,OVERCLOCK)

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

### Expand Swap <img src="https://user-images.githubusercontent.com/62630527/163094821-b5a44e52-c43a-4b3d-91c1-2f87c83369bd.png" width="25px"> 

When it comes to expanding the swap memory, it is recommended to leave by default only twice the current memory, this in the case of boards like this, even though you can set the one you want to use.

To increase the current memory to double just execute by default it will increase 735M to have 1G.

    sudo chmod 777 swap_memori.sh
    sudo ./swap_memori.sh

To increase by another amount modify the line (sudo fallocate -l 735M) for the amount you want.

    sudo chmod 777 swap_memori.sh
    sudo sed -i 's/sudo fallocate -l 735M /sudo fallocate -l (Cantidad #M o #G) /g' swap_memori.sh
    sudo ./swap_memori.sh

### Usage examples <img src="https://user-images.githubusercontent.com/62630527/160256612-06e00bf6-ee81-4ea0-a317-7d42f3c6196c.png" width="25px">

You can find examples for the oled screen in the directory /home/$user/gpio_files/luma.examples/examples/ and other examples on the use of leds, buttons, events, pull_up, pwm, system information and event detection in the directory /home/$user/gpio-examples/

### gpio pin table via terminal (sudo gpioread) <img src="https://user-images.githubusercontent.com/62630527/176109582-31f37087-5e49-415e-aadb-4efd5668edc0.png" width="25px">

![6](https://user-images.githubusercontent.com/62630527/176101146-0fb914c6-8f1c-4634-ba11-dbea3f15180f.PNG)
####

### Device i2c address detection (sudo i2cdetect -y 0)

![9](https://user-images.githubusercontent.com/62630527/176101171-2a72f677-3944-4753-aed8-9ed432dedb66.PNG)
####

### i2c OLED display examples <img src="https://user-images.githubusercontent.com/62630527/176109587-952627c0-96bc-4810-9dfd-1edb4637cfe5.png" width="25px">

![7](https://user-images.githubusercontent.com/62630527/176101345-bc48c74c-8161-4502-8d55-eb5802301307.PNG)
####
![oled](https://user-images.githubusercontent.com/62630527/176106171-b21df7ee-d24a-4f4d-8b7a-014cc82f2d80.jpg)
####

### Example system information with i2c oled display

![8](https://user-images.githubusercontent.com/62630527/176101491-75df82de-12f1-406d-aedb-c7f87fea6381.PNG)
####
![sys_info](https://user-images.githubusercontent.com/62630527/176106194-a8ac4df0-198f-464d-99b1-cd5483170b6f.jpg)
####

### Example for use of led <img src="https://user-images.githubusercontent.com/62630527/176109620-94e3b427-783d-4274-a708-a76adf119844.png" width="25px">

![10](https://user-images.githubusercontent.com/62630527/176103746-0dbd4700-3456-4118-ae95-bdbda1e9a4ea.PNG)
####
![led](https://user-images.githubusercontent.com/62630527/176106154-f7822c22-77c9-4111-93a5-76cf7c97efd0.jpg)
####

### Example button connection pull_up <img src="https://user-images.githubusercontent.com/62630527/176109611-b8c7d04c-e54a-4009-9c40-371dbbda2126.png" width="25px">

![11](https://user-images.githubusercontent.com/62630527/176103757-7448a539-867d-430e-9bb1-27a20e619353.PNG)
####
![button](https://user-images.githubusercontent.com/62630527/176106138-65b30851-8ca3-4313-b3f3-d003d0803f18.jpg)
####

### Location and function of physical gpio pins

![1e2e5830e341ad050857fd65e18ea8e5680841ec](https://user-images.githubusercontent.com/62630527/128299639-437c126b-73d8-4a9d-8c36-1213c70cff20.jpg)
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

    ▶️ TuryRx 🔥
    https://www.youtube.com/channel/UC2qm0bsEO0u1wBgiINs8-5w

## Downloads <img src="https://user-images.githubusercontent.com/62630527/158044106-a52b6ef1-a65d-42d1-b376-79284df8721b.png" width="25px">

## Images Bananapi M2 Zero 18-02-23 <img src="https://user-images.githubusercontent.com/62630527/172993373-e48489ba-2b27-4de8-9504-a8119bb25a78.png" width="25px">

### Base Ubuntu Focal <img src="https://user-images.githubusercontent.com/62630527/172993496-2ac24566-8881-4862-a976-69f49d257cfc.png" width="25px">

#### Ubuntu Focal Server
    https://www.mediafire.com/file/f3zop887yjmqvo6/Armbian_23.02.0-trunk.0264_Bananapim2zero_focal_current_5.15.93_server.rar/file

#### Ubuntu Focal Server Minima
    https://www.mediafire.com/file/fjba6l2uqfcstqq/Armbian_23.02.2_Bananapim2zero_focal_current_5.15.93_server_minimal.rar/file

#### Ubuntu Focal Desktop xfce
    https://www.mediafire.com/file/yms7q2hiyqeob6u/Armbian_23.02.0-trunk_Bananapim2zero_focal_current_5.15.93_xfce_desktop.rar/file


### Base Ubuntu Jammy <img src="https://user-images.githubusercontent.com/62630527/172993533-1f865635-977b-4d7e-83e6-883e8bf1c9cb.png" width="25px">

#### Ubuntu Jammy Server
    https://www.mediafire.com/file/fvjhy045ybfc81n/Armbian_22.11.0-trunk_Bananapim2zero_jammy_current_5.15.80_server.rar/file

#### Ubuntu Jammy Server Minima
    https://www.mediafire.com/file/509uuchjp8jmk34/Armbian_22.11.0-trunk_Bananapim2zero_jammy_current_5.15.80_server_minimal.rar/file

#### Ubuntu Jammy Desktop xfce
    https://www.mediafire.com/file/250razne7xr4ocq/Armbian_22.11.0-trunk_Bananapim2zero_jammy_current_5.15.80_xfce_desktop.rar/file

#### Ubuntu Jammy Desktop i3wm
    https://www.mediafire.com/file/vjcj0sqdj3hhakn/Armbian_22.11.0-trunk_Bananapim2zero_jammy_current_5.15.80_i3-wm_desktop.rar/file


### Base Debian Buster <img src="https://user-images.githubusercontent.com/62630527/172993606-923c9b2d-11a6-480f-8cd9-c342bc28c42d.png" width="25px">

#### Debian Buster Server
    https://www.mediafire.com/file/kx4zckpabug0y87/Armbian_23.02.0-trunk.0264_Bananapim2zero_buster_current_5.15.93_server.rar/file

#### Debian Buster Server Mininal
    https://www.mediafire.com/file/pjqn7xw9bqbejab/Armbian_23.02.0-trunk.0264_Bananapim2zero_buster_current_5.15.93_server_minimal.rar/file

#### Debian Buster Desktop lxde
    https://www.mediafire.com/file/uofhauefzrkxq91/Armbian_23.02.0-trunk.0264_Bananapim2zero_buster_current_5.15.93_lxde_desktop.img.rar/file

#### Debian Buster Desktop Mate
    https://www.mediafire.com/file/4i761iai2eazgu9/Armbian_23.02.0-trunk.0264_Bananapim2zero_buster_current_5.15.93_mate_desktop.rar/file


### Base Debian Bullseye <img src="https://user-images.githubusercontent.com/62630527/172993639-7163fab8-4268-4218-a267-a483b189e5ae.png" width="25px">

#### Debian Bullseye Server
    https://www.mediafire.com/file/0jilyu1f2ohtvqk/Armbian_22.11.0-trunk_Bananapim2zero_bullseye_current_5.15.80_server.rar/file

#### Debian Bullseye Server Mininal
    https://www.mediafire.com/file/1yltw5sk4q4vzzu/Armbian_22.11.0-trunk_Bananapim2zero_bullseye_current_5.15.80_minimal.img.rar/file


### ArchLinux <img src="https://user-images.githubusercontent.com/62630527/230496763-eabde1d7-2e85-49a2-b646-d6b4286d5ad3.png" width="25px">
    coming soon

### AlpineLinux <img src="https://user-images.githubusercontent.com/62630527/230496808-daeaea20-3007-4043-b464-ab475b7536af.png" width="25px">
    coming soon

### LibreELEC <img src="https://user-images.githubusercontent.com/62630527/230498503-4ad65bfd-a68b-4a45-806b-e1730051203c.png" width="25px">

#### LibreELEC Kodi 20
    https://www.mediafire.com/file/6vuzdxlawoomisq/LibreELEC_H2_Bananapi_M2_Zero.rar/file

### Old Images

#### [Banana pi M2 Zero 2021-2022 old images archive](https://github.com/TuryRx/Banana-pi-m2-zero-Images)

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