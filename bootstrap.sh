# update ubuntu
sudo apt-get update -y

# install dependencies
sudo apt-get install -y libboost-all-dev g++ make automake autoconf libtool python-dev swig git

# setup and enable 4g swap
# https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo sysctl vm.swappiness=10

# get and install quantlib
# http://quantlib.org/install/linux.shtml
git clone -q https://github.com/lballabio/QuantLib.git
cd QuantLib
./autogen.sh
./configure --enable-intraday
make
sudo make install
sudo ldconfig

# get and install anaconda python
# https://www.continuum.io/downloads#_unix
cd ~
wget -q http://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh -O ~/anaconda.sh
bash ~/anaconda.sh -b -p $HOME/anaconda2
export PATH="$HOME/anaconda2/bin:$PATH"

# get and install quantlib-swig
# http://quantlib.org/install/linux-python.shtml
cd ~
git clone https://github.com/lballabio/QuantLib-SWIG.git
cd QuantLib-SWIG
./autogen.sh
./configure --disable-perl --disable-ruby --disable-mzscheme --disable-guile --disable-csharp --disable-ocaml --disable-r --disable-java
make -C Python
sudo make -C Python install
sudo ldconfig

# start unsecured notebook server
http://jupyter-notebook.readthedocs.io/en/latest/public_server.html
cd ~
jupyter notebook --generate-config
cd ~/.jupyter
rm jupyter_notebook_config.py
wget -q https://raw.githubusercontent.com/jasonstrimpel/quantlib-python-on-vagrant/master/jupyter_notebook_config.py
mkdir ~/notebooks
cd ~/notebooks
jupyter notebook

