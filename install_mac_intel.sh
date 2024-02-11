# Mac OSX INTEL CPU ONLY Installation for Zephyr RTOS
# Based on zephyr install script

#download and install zephyr sdk
mkdir $HOME/zephyr_install
wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.16.5/zephyr-sdk-0.16.5_macos-x86_64_minimal.tar.xz -P $HOME/zephyr_install
tar xvf $HOME/zephyr_install/zephyr-sdk-0.16.5_macos-x86_64_minimal.tar.xz -C $HOME/zephyr_install
rm $HOME/zephyr_install/zephyr-sdk-0.16.5_macos-x86_64_minimal.tar.xz
$HOME/zephyr_install/zephyr-sdk-0.16.4/setup.sh -t arm-zephyr-eabi -h -c

#install zephyr west tool
cd $HOME/zephyr_install
python3 -m venv env
source $HOME/zephyr_install/env/bin/activate
cd $HOME
echo source $HOME/zephyr_install/env/bin/activate >> $HOME/.bashrc
pip3 install west
source $HOME/.bashrc

#install nrf command line tools
wget https://nsscprodmedia.blob.core.windows.net/prod/software-and-other-downloads/desktop-software/nrf-command-line-tools/sw/versions-10-x-x/10-24-0/nrf-command-line-tools-10.24.0-darwin.dmg -P $HOME/zephyr_install
cd $HOME/zephyr_install
installer nrf-command-line-tools-10.24.0-darwin.dmg
sudo apt install /opt/nrf-command-line-tools/share/JLink_Linux_V794e_x86_64.deb --fix-broken