FROM centos
# Step 1: AWS CLI installation
RUN yum -y install unzip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN sleep 5

# Step 2: Installation of EKSCTL command line utility on Linux
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
RUN mv /tmp/eksctl /usr/local/bin
RUN eksctl version
RUN sleep 5

#Step 3: Install kubectl CLI on Linux
RUN mkdir /kubectlbinary
WORKDIR /kubectlbinary
RUN curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
RUN echo 'export PATH=$PATH:$HOME/bin' >> ~/.bash_profile
RUN source ~/.bash_profile
RUN kubectl version --short --client 
# kubectl version --short --client will fail. just login in the container, source ~/.bash_profile and check it again and it run just fine. Run it each that you pull the image



