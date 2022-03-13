#!/bin/sh 

echo '  __  __             _           ___            ___                          '
echo ' |  \/  |  __ _   __| |  ___    | _ )  _  _    | _ \  ___  __ __  __ _   ___ '
echo ' | |\/| | / _` | / _` | / -_)   | _ \ | || |   |   / / _ \ \ \ / / _` | (_-< '
echo ' |_|  |_| \__,_| \__,_| \___|   |___/  \_, |   |_|_\ \___/ /_\_\ \__,_| /__/ '
echo '                                       |__/                                  '

echo ''

echo '          Welcome to GPIO Installation Wizard for Bananapi m2 zero'

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
python-dev \
lm-sensors \
armbian-config

sleep 2s

echo ''

echo '--------------------Installation of Libraries for Python---------------------'

echo ''

sleep 2s

sudo python3 -m pip install --upgrade pip setuptools wheel
#sudo pip3 install adafruit-circuitpython-ssd1306
#sudo pip3 install Adafruit-SSD1306
sudo pip3 install Adafruit-Blinka
sudo pip3 install smbus2
#sudo pip3 install --upgrade ssd1306
sudo pip3 install pusherclient
sudo pip3 install psutil
sudo pip3 install tweepy
sudo pip3 install feedparser
sudo pip3 install subprocess.run
sudo pip3 install vcgencmd

sleep 2s

echo ''

echo '-----------------------Download Necessary Files of git-----------------------'

echo ''

sleep 2s

echo 'What is your directory (example:/home/******)'
read directory
cd /home/$directory

echo ''

git clone https://github.com/adafruit/Adafruit_Python_GPIO.git
git clone https://github.com/BPI-SINOVOIP/BPI-WiringPi2.git
git clone https://github.com/LeMaker/RPi.GPIO_BP -b bananapi
git clone https://github.com/codelectron/ssd1306.git
git clone https://github.com/rm-hull/luma.oled.git
git clone https://github.com/BPI-SINOVOIP/RPi.GPIO.git
git clone https://github.com/rm-hull/luma.examples.git
git clone https://github.com/TuryRx/Bananapi-m2-zero-GPIO-files.git

sleep 2s

echo ''

echo '--------------------------Install Downloaded Files----------------------------'

echo ''

sleep 2s

cd Adafruit_Python_GPIO
sudo python3 setup.py install
cd ..

cd BPI-WiringPi2
sudo ./build
cd ..

cd RPi.GPIO_BP
sudo python3 setup.py install
cd ..

cd ssd1306
sudo python3 setup.py install
cd ..

cd luma.oled
sudo python3 setup.py install
cd ..

cd RPi.GPIO
sudo python3 setup.py install
cd

sudo pip3 install Adafruit-SSD1306
sudo pip3 install --upgrade ssd1306
sudo pip3 install adafruit-circuitpython-ssd1306
sudo pip3 install --upgrade luma.oled

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

echo '------------------------------Add User to i2c Group---------------------------'

echo ''

sleep 2s

sudo adduser $directory i2c

echo 'user successfully added to i2c group'

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
echo 'allow_writeable_chroot=YES' | tee -a /etc/vsftpd.conf
echo 'pasv_enable=Yes' | tee -a /etc/vsftpd.conf
echo 'pasv_min_port=40000' | tee -a /etc/vsftpd.conf
echo 'pasv_max_port=40100' | tee -a /etc/vsftpd.conf

cd /home/$directory
cd Bananapi-m2-zero-GPIO-files
sudo chmod 777 m2z_led.py
sudo mv m2z_led.py /home/$directory 
sudo chmod 777 sys_stats.py
sudo mv sys_stats.py /home/$directory/luma.examples/examples/
cd ..
sudo mkdir gpio_files
sudo mv m2z_led.py gpio_files/
sudo mv Adafruit_Python_GPIO/ gpio_files/
sudo mv Bananapi-m2-zero-GPIO-files/ gpio_files/
sudo mv BPI-WiringPi2/ gpio_files/
sudo mv luma.examples/ gpio_files/
sudo mv luma.oled/ gpio_files/
sudo mv RPi.GPIO/ gpio_files/
sudo mv RPi.GPIO_BP/ gpio_files/
sudo mv ssd1306/ gpio_files/
ln -s /home/$directory/gpio_files/luma.examples/examples/sys_stats.py /home/$directory/
ln -s /home/$directory/gpio_files/m2z_led.py /home/$directory/

echo ''

echo 'Operation Successfully Completed'

sleep 2s

echo ''
  
echo 'I hope and this script will help you to make the installation of the gpio pins' 
echo 'a bit easier on the bananapi m2 zero'  

echo ''

echo 'I leave you the link of my repository in git more detailed for this'
echo 'and the link of my channel if you like this type of development'
echo 'I would appreciate if you would like and subscribe to my channel'

echo ''

echo 'Youtube TuryRx'
echo 'https://www.youtube.com/channel/UCsVnls-pcXUDKCafBRPJIsg'

echo ''

echo 'github link'
echo 'https://github.com/TuryRx/Bananapi-m2-zero-GPIO'

sleep 10s

echo ''