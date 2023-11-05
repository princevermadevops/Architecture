FROM --platform=linux/amd64 centos:7

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yum check-update; \
    yum install -y gcc libffi-devel python3 epel-release; \
    yum install -y python3-pip; \
    yum install -y wget; \
    yum clean all

RUN pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install pywinrm[kerberos]; \
    pip3 install pywinrm; \
    pip3 install jmspath; \
    pip3 install requests; \
    yum -y install epel-release;\
    yum -y install ansible;

#installing kubectl in docker container
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#installing HELM3 in docker container
RUN wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz;\
    tar xvf helm-v3.9.3-linux-amd64.tar.gz;\
    mv linux-amd64/helm /usr/local/bin;\
    ls -lart;\
    rm helm-v3.9.3-linux-amd64.tar.gz

# installing Terraform in centos Container
RUN yum install -y yum-utils;\
    yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo;\
    yum -y install terraform

# install AWS CLI
RUN yum -y install zip;\
    yum -y install unzip;\ 
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip";\
    ls -lart;\
    unzip awscliv2.zip;\
    ./aws/install;\
    rm awscliv2.zip

# install Google Cloud CLI

COPY gcpcli.sh gcpcli.sh

RUN chmod 777 gcpcli.sh;\
    ./gcpcli.sh

RUN yum -y install google-cloud-cli;\
    gcloud version