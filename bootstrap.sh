# update ubuntu
sudo apt-get update -y

# install dependencies
sudo apt-get install -y libboost-all-dev make automake autoconf libtool python-dev swig git

# get and install quantlib
# http://quantlib.org/install/linux.shtml
git clone https://github.com/lballabio/QuantLib.git
cd QuantLib
./autogen.sh
./configure
make
sudo make install
sudo ldconfig

# get and install anaconda python
# https://www.continuum.io/downloads#_unix
cd ../
wget http://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh -O ~/anaconda.sh
bash ~/anaconda.sh -b -p $HOME/anaconda2
export PATH="$HOME/anaconda2/bin:$PATH"

# get and install quantlib-swig
# http://quantlib.org/install/linux-python.shtml
git clone https://github.com/lballabio/QuantLib-SWIG.git
cd QuantLib-SWIG
./autogen.sh
./configure
make -C Python
sudo make -C Python install
sudo ldconfig
