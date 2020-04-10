snap install microk8s --classic

sudo usermod -a -G microk8s bradley
sudo chown -f -R bradley ~/.kube

# snap alias microk8s.kubectl kubectl
