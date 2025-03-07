# Mac OSX ARM CPU ONLY Installation for Zephyr RTOS
# Based on zephyr install script

sudo xcode-select --install

brew install cmake ninja gperf python3 ccache qemu dtc libmagic openocd wget


#download and install zephyr sdk
mkdir $HOME/zephyr_install
cd $HOME/zephyr_install && curl -L -O https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.17.0/zephyr-sdk-0.17.0_macos-aarch64_minimal.tar.xz
tar xvf $HOME/zephyr_install/zephyr-sdk-0.17.0_macos-aarch64_minimal.tar.xz -C $HOME/zephyr_install
rm $HOME/zephyr_install/zephyr-sdk-0.17.0_macos-aarch64_minimal.tar.xz
$HOME/zephyr_install/zephyr-sdk-0.17.0/setup.sh -t arm-zephyr-eabi -h -c

#install zephyr west tool
cd $HOME/zephyr_install
python3 -m venv env
source $HOME/zephyr_install/env/bin/activate
cd $HOME
echo source $HOME/zephyr_install/env/bin/activate >> $HOME/.zprofile
echo source $HOME/zephyr_install/env/bin/activate >> $HOME/.bashrc
echo source $HOME/zephyr_install/env/bin/activate >> $HOME/.profile
pip3 install west
source $HOME/.zprofile
source $HOME/.bashrc
source $HOME/.profile

#install nrf command line tools
cd $HOME/zephyr_install && curl -L -O https://nsscprodmedia.blob.core.windows.net/prod/software-and-other-downloads/desktop-software/nrf-command-line-tools/sw/versions-10-x-x/10-24-0/nrf-command-line-tools-10.24.0-darwin.dmg
cd $HOME/zephyr_install
hdiutil mount nrf-command-line-tools-10.24.0-darwin.dmg

