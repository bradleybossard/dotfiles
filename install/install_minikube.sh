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
fi
