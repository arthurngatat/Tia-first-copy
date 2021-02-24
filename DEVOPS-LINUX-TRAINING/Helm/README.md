### Install helm 2.17
```
cd /tmp 
wget https://get.helm.sh/helm-v2.17.0-linux-amd64.tar.gz -O /tmp/helm.tar.gz ; \
tar xf helm.tar.gz ; \
mv linux-amd64/helm /usr/local/bin/
helm version --short
```

### Install Helm
* [Helm release](https://github.com/helm/helm/releases)
* [Helm Website](https://helm.sh/)
* [Quickstart Guide](https://helm.sh/docs/intro/quickstart/)
curl -LO https://get.helm.sh/helm-v3.5.0-linux-amd64.tar.gz
tar -zxvf helm-v3.5.0-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
helm version --short
* Add helm report
helm repo add stable https://charts.helm.sh/stable