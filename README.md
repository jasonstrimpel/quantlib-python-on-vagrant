# quantlib-python-on-vagrant
Bootstrap file to setup QuantLib for Python on Vagrant

Just add the `bootstrap.sh` file to your `Vagrantfile`

1. Updates your crufty linux distribution
2. Installs the dependencies (Boost, swig, git and the usual suspects)
3. Gets the latest QuantLib from GitHub, configures and installs
4. Gets Anaconda Python (2.7) and installs using default parameters
5. Gets the latest QuantLib-SWIG from GitHub, configures and installs
