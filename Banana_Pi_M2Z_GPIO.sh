#!/bin/sh 

echo '  __  __             _           ___            ___                          '
echo ' |  \/  |  __ _   __| |  ___    | _ )  _  _    | _ \  ___  __ __  __ _   ___ '
echo ' | |\/| | / _` | / _` | / -_)   | _ \ | || |   |   / / _ \ \ \ / / _` | (_-< '
echo ' |_|  |_| \__,_| \__,_| \___|   |___/  \_, |   |_|_\ \___/ /_\_\ \__,_| /__/ '
echo '                                       |__/                                  '

echo ''

echo '          Welcome to GPIO Installation Wizard for Bananapi m2 zero'
echo '                                 rev 1.6.1.2                                 '

sleep 5s

echo ''

echo '-------------------------Add Repositories and Update-------------------------'

echo ''

sleep 2s

sudo apt-get -y update
sudo apt-get -y upgrade

sleep 2s

sudo apt-get install -y software-properties-common 

sleep 2s

sudo add-apt-repository -y universe
sudo add-apt-repository -y multiverse
sudo add-apt-repository -y restricted

sleep 2s

sudo apt-get -y update
sudo apt-get -y upgrade

sleep 2s

echo ''

echo '------------------Installation of Packages and Dependencies------------------'

echo ''

sleep 2s

sudo apt-get install -y inxi \
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
python3-dev \
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

sleep 2s

echo ''

echo '--------------------Installation of Libraries for Python---------------------'

echo ''

sleep 2s

sudo pip3 install setuptools==58.3.0
sudo pip3 install wheel==0.37.0
sudo pip3 install pyserial==3.5
sudo pip3 install pyusb==1.2.1
sudo pip3 install pyftdi==0.54.0
sudo pip3 install Adafruit-PureIO==1.1.9
sudo pip3 install Adafruit-PlatformDetect==3.22.0
sudo pip3 install Adafruit-Blinka==7.1.1
#sudo python3 -m pip install --upgrade pip setuptools wheel
#sudo pip3 install adafruit-circuitpython-ssd1306
#sudo pip3 install Adafruit-SSD1306
sudo pip3 install smbus2==0.4.1
sudo pip3 install Deprecated==1.2.13
sudo pip3 install Pillow==9.4.0
sudo pip3 install RPi.GPIO==0.6.3
sudo pip3 install spidev==3.5
sudo pip3 install argcomplete==2.1.1
sudo pip3 install wrapt==1.14.0
#sudo pip3 install --upgrade ssd1306
sudo pip3 install pusherclient==0.3.0
sudo pip3 install psutil==5.8.0
sudo pip3 install oauthlib==3.1.1
sudo pip3 install requests-oauthlib==1.3.0
sudo pip3 install tweepy==4.2.0
sudo pip3 install sgmllib3k==1.0.0
sudo pip3 install feedparser==6.0.8
sudo pip3 install subprocess.run==0.0.8
sudo pip3 install vcgencmd==0.1.1
#sudo pip3 install Pillow==9.2.0
#sudo pip3 install cbor2==5.4.3
#sudo -H pip install --upgrade pip setuptools

sleep 2s

echo ''

echo '-----------------Extract and Download Necessary Files of git-----------------'

echo ''

sleep 2s

echo 'What is your directory (example:/home/******)'
read directory
cd /home/$directory

echo ''

git clone https://github.com/TuryRx/Bananapi-m2-zero-GPIO-files.git
git clone https://github.com/adafruit/Adafruit_Python_GPIO.git
###git clone https://github.com/BPI-SINOVOIP/BPI-WiringPi2.git
git clone https://github.com/bontango/BPI-WiringPi2.git
git clone https://github.com/LeMaker/RPi.GPIO_BP -b bananapi
git clone https://github.com/codelectron/ssd1306.git
###git clone https://github.com/BPI-SINOVOIP/RPi.GPIO.git //Old library
###git clone https://github.com/GrazerComputerClub/RPi.GPIO.git
sudo unrar x /home/$directory/Banana-pi-m2-zero-GPIO/luma.examples.rar /home/$directory
sudo unrar x /home/$directory/Banana-pi-m2-zero-GPIO/luma.oled.rar /home/$directory

##sudo unrar x /home/$directory/Banana-pi-m2-zero-GPIO/Adafruit_Python_GPIO.rar /home/$directory
##sudo unrar x /home/$directory/Banana-pi-m2-zero-GPIO/BPI-WiringPi2.rar /home/$directory
##sudo unrar x /home/$directory/Banana-pi-m2-zero-GPIO/RPi.GPIO_BP.rar /home/$directory
##sudo unrar x /home/$directory/Banana-pi-m2-zero-GPIO/ssd1306.rar /home/$directory
##sudo unrar x /home/$directory/Banana-pi-m2-zero-GPIO/RPi.GPIO.rar /home/$directory
##sudo unrar x /home/$directory/Banana-pi-m2-zero-GPIO/luma.examples.rar /home/$directory
##sudo unrar x /home/$directory/Banana-pi-m2-zero-GPIO/luma.oled.rar /home/$directory

sudo rm -R /home/$directory/BPI-WiringPi2/gpio/readall.c
sudo cp /home/$directory/Banana-pi-m2-zero-GPIO/readall.c /home/$directory/BPI-WiringPi2/gpio/

sleep 2s

echo ''

echo '--------------------------Install Downloaded Files----------------------------'

echo ''

sleep 2s

cd Adafruit_Python_GPIO
sudo python3 setup.py install
cd ..

cd BPI-WiringPi2
sudo chmod 777 build
sudo ./build
cd ..

cd RPi.GPIO_BP
sudo python3 setup.py install
cd ..

cd ssd1306
sudo python3 setup.py install
cd ..

sudo rm -R /usr/local/lib/python3.8/dist-packages/luma*
#cd luma.oled
#sudo python3 setup.py install
#cd ..

#cd RPi.GPIO
#sudo python3 setup.py install
#cd ..

sudo pip3 install Adafruit-SSD1306==1.6.2
sudo pip3 install ssd1306==0.2.0
sudo pip3 install adafruit-circuitpython-busdevice==5.1.0
sudo pip3 install adafruit-circuitpython-framebuf==1.4.7
sudo pip3 install adafruit-circuitpython-ssd1306==2.12.2
sudo pip3 install cbor2==5.4.2
#sudo pip3 install luma.core==2.3.1
sudo pip3 install luma.oled==3.8.1

echo ''

echo 'Complete file installation'

sleep 2s

echo ''

echo '----------------------------Copy Files for use GPIO---------------------------'

echo ''

sleep 2s

cd /home/$directory
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

echo 'Files Copied Successfully'

sleep 2s

echo ''

echo '----------------------------------Fix Problems--------------------------------'

echo ''

sleep 2s

sudo rm -R /usr/local/lib/python3.8/dist-packages/RPi*
sudo unrar x /home/$directory/Banana-pi-m2-zero-GPIO/RPi.GPIO.rar /home/$directory/

cd /home/$directory/RPi.GPIO
sudo python3 setup.py install
cd ..

cd /home/$directory/RPi.GPIO_BP
sudo python3 setup.py install
cd ..

mv /home/$directory/Banana-pi-m2-zero-GPIO/bananapi-m2-zero-eth0.dtbo /boot/overlay-user/

echo 'Operation Successfully Completed'

sleep 2s

echo ''

echo '------------------------------Add User to i2c Group---------------------------'

echo ''

sleep 2s

sudo adduser $directory i2c

echo 'user successfully added to i2c group'

sleep 2s

echo ''

echo '------------------------------Increase swap memory----------------------------'

echo ''

sleep 2s

cd /home/$directory/Banana-pi-m2-zero-GPIO/
sudo chmod 777 swap_memori.sh
sudo ./swap_memori.sh

sleep 2s

echo ''

echo '---------------Completing System Files and Enable ftp in Sistem---------------'  

echo ''

sleep 2s

sed -i 's/BOARD=bpi-m3/BOARD=bpi-m2z/g' /var/lib/bananapi/board.sh
sed -i 's/BOARD_AUTO=bpi-m3/BOARD_AUTO=bpi-m2z/g' /var/lib/bananapi/board.sh
sed -i 's/#write_enable=YES/write_enable=YES/g' /etc/vsftpd.conf
sed -i 's/#local_umask=022/local_umask=022/g' /etc/vsftpd.conf
sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/g' /etc/vsftpd.conf
echo 'allow_writeable_chroot=YES' | sudo tee -a /etc/vsftpd.conf
echo 'pasv_enable=Yes' | sudo  tee -a /etc/vsftpd.conf
echo 'pasv_min_port=40000' | sudo tee -a /etc/vsftpd.conf
echo 'pasv_max_port=40100' | sudo tee -a /etc/vsftpd.conf

cd /home/$directory
sudo mkdir /home/$directory/gpio-examples
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
sudo chmod 777 gpioread.sh
sudo mv gpioread.sh /usr/local/bin/gpioread
sudo chmod o+x /usr/local/bin/gpioread
sudo chmod 777 /usr/local/bin/gpioread
sudo touch /var/lib/bananapi/gpio
sudo chmod o+x /var/lib/bananapi/gpio
sudo chmod 777 /var/lib/bananapi/gpio
cd ..
sudo mkdir gpio_files
sudo mv led_m2z.py gpio_files/
sudo mv led_button_m2z.py gpio_files/
sudo mv button_state_m2z.py gpio_files/
sudo mv button_event_m2z.py gpio_files/
sudo mv gpio_funcion_m2z.py gpio_files/
sudo mv info_board_m2z.py gpio_files/
sudo mv info_gpio_m2z.py gpio_files/
sudo mv pwm_m2z.py gpio_files/
sudo mv button_pull_up_m2z.py gpio_files/
sudo mv gpio_read_pin_m2z.py gpio_files/
sudo mv button_event_rising_m2z.py gpio_files/
sudo mv Adafruit_Python_GPIO/ gpio_files/
sudo mv Bananapi-m2-zero-GPIO-files/ gpio_files/
sudo mv BPI-WiringPi2/ gpio_files/
sudo mv luma.examples/ gpio_files/
sudo mv luma.oled/ gpio_files/
sudo mv RPi.GPIO/ gpio_files/
sudo mv RPi.GPIO_BP/ gpio_files/
sudo mv ssd1306/ gpio_files/
sudo chmod 777 -R  * gpio_files/luma.examples/examples/
ln -s /home/$directory/gpio_files/luma.examples/examples/sys_stats.py /home/$directory/gpio-examples/
ln -s /home/$directory/gpio_files/led_m2z.py /home/$directory/gpio-examples/
ln -s /home/$directory/gpio_files/led_button_m2z.py /home/$directory/gpio-examples/
ln -s /home/$directory/gpio_files/button_state_m2z.py /home/$directory/gpio-examples/
ln -s /home/$directory/gpio_files/button_event_m2z.py /home/$directory/gpio-examples/
ln -s /home/$directory/gpio_files/gpio_funcion_m2z.py /home/$directory/gpio-examples/
ln -s /home/$directory/gpio_files/info_board_m2z.py /home/$directory/gpio-examples/
ln -s /home/$directory/gpio_files/info_gpio_m2z.py /home/$directory/gpio-examples/
ln -s /home/$directory/gpio_files/pwm_m2z.py /home/$directory/gpio-examples/
ln -s /home/$directory/gpio_files/button_pull_up_m2z.py /home/$directory/gpio-examples/
ln -s /home/$directory/gpio_files/gpio_read_pin_m2z.py /home/$directory/gpio-examples/
ln -s /home/$directory/gpio_files/button_event_rising_m2z.py /home/$directory/gpio-examples/
sudo chmod 775 -R * ~/

sudo cd /home/$directory/
sudo mkdir Ethernet
cd Bananapi-m2-zero-GPIO-files
sudo chmod 777 Activate Ethernet.sh
sudo chmod 777 Disable Ethernet.sh
sudo mv Activate Ethernet.sh /home/$directory/Ethernet
sudo mv Disable Ethernet.sh /home/$directory/Ethernet

echo ''

echo 'Operation Successfully Completed'

sleep 2s

echo ''
  
echo 'I hope and this script will help you to make the installation of the gpio pins' 
echo 'a bit easier on the bananapi m2 zero'  

echo ''

echo 'I leave you the link of my repository in more detailed git for this'
echo 'and the link of my channel if you like this type of development'
echo 'I would appreciate it if you would like and subscribe to my channel'
echo 'And if you like my work and want to support me so that'
echo 'I keep uploading more content, I ll leave you my ko-fi'

echo ''

echo 'Youtube TuryRx'
echo 'https://www.youtube.com/channel/UC2qm0bsEO0u1wBgiINs8-5w'

echo ''

echo 'github link'
echo 'https://github.com/TuryRx/Bananapi-m2-zero-GPIO'

echo ''

echo 'Ko-fi'
echo 'https://ko-fi.com/turyrx'

sleep 2s

echo ''