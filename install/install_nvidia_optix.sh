sudo apt install --yes cmake cmake-curses-gui

sudo apt -y install gcc-8 g++-8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 8
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 8

cmake \
  -DCUDA_TOOLKIT_ROOT_DIR=/usr/lib/cuda-10.2 \
  -DCMAKE_C_COMPILER=$(which gcc-8) \
  -DCMAKE_CXX_COMPILER=$(which g++-8) \
  ../SDK


===========
= Summary =
===========

Driver:   Not Selected
Toolkit:  Installed in /usr/local/cuda-11.1/
Samples:  Installed in /home/bradleybossard/

Please make sure that
 -   PATH includes /usr/local/cuda-11.1/bin
  -   LD_LIBRARY_PATH includes /usr/local/cuda-11.1/lib64, or, add /usr/local/cuda-11.1/lib64 to /etc/ld.so.conf and run ldconfig as root

  To uninstall the CUDA Toolkit, run cuda-uninstaller in /usr/local/cuda-11.1/bin
  ***WARNING: Incomplete installation! This installation did not install the CUDA Driver. A driver of version at least 455.00 is required for CUDA 11.1 functionality to work.
  To install the driver using this installer, run the following command, replacing <CudaInstaller> with the name of this run file:
      sudo <CudaInstaller>.run --silent --driver

      Logfile is /var/log/cuda-installer.log
      sudo sh ./cuda_11.1.1_455.32.00_linux.run  128.13s user 56.99s system 74% cpu 4:08.56 total
