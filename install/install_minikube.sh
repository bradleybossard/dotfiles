#!/bin/bash
if [[ $OSTYPE == *"darwin"* ]]; then
  # NOTE: Do not install VirtualBox if you have Docker for Mac installed.
  # It comes with hyperkit already

  brew install kubectl

  # NOTE: Installs v0.25.2, newer version may be available
  curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.25.2/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

  # Install the hyperkit driver
  curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit \
    && chmod +x docker-machine-driver-hyperkit \
    && sudo mv docker-machine-driver-hyperkit /usr/local/bin/ \
    && sudo chown root:wheel /usr/local/bin/docker-machine-driver-hyperkit \
    && sudo chmod u+s /usr/local/bin/docker-machine-driver-hyperkit

  # Starts minikube using hyperkit
  minikube start --vm-driver hyperkit 
elif [[ $OSTYPE == *"linux"* ]]; then
  # Install kubectl
  # TODO: Installing via snap didn't seem to put kubectl in PATH.  Check again
  # on fresh install
  # sudo snap install kubectl --classic
  curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/v1.10.0/bin/linux/amd64/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/

  # installing kvm2 driver for minikube
  sudo apt-get install --yes libvirt-bin
  curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2 && chmod +x docker-machine-driver-kvm2 && sudo mv docker-machine-driver-kvm2 /usr/local/bin/
  # install minikube
  # TODO(bradleybossard): Add logic to determine and install latest version automatically 
  curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.27.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

  # Starts minikube using hyperkit
  minikube start --vm-driver kvm2
fi
