# Linux Installation for Zephyr RTOS
# Based on 

sudo apt-get update
sudo apt-get install -y wget

#Install prerequisits for Zephyr
sudo apt install --no-install-recommends git cmake ninja-build gperf \
  ccache dfu-util device-tree-compiler wget \
  python3-dev python3-pip python3-setuptools python3-tk python3-wheel xz-utils file \
  make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1

#install zephyr west tool
sudo apt install python3-venv    #install python virtual environment
pip install west

#download and install zephyr sdk
mkdir $HOME/zephyr_install
wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.16.4/zephyr-sdk-0.16.4_linux-x86_64_minimal.tar.xz -P $HOME/zephyr_install
tar xvf $HOME/zephyr_install/zephyr-sdk-0.16.4_linux-x86_64_minimal.tar.xz
rm $HOME/zephyr_install/zephyr-sdk-0.16.4_linux-x86_64_minimal.tar.xz


#Allow access to serial ports
sudo apt-get remove modemmanager brltty	#Remove serial terminal interference
sudo adduser $USER dialout		#Add user permissions for dialout
