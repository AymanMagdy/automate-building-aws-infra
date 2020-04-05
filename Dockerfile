FROM jenkins/jenkins:lts
USER root
EXPOSE 8080

RUN apt-get update & apt-get install -y \
wget \
unzip 

RUN wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_freebsd_amd64.zip \
 && unzip terraform_0.12.24_freebsd_amd64.zip \
 && mv terraform /usr/bin \
 && rm -rf terraform_0.12.24_freebsd_amd64.zip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
 && unzip awscliv2.zip \
 && ./aws/install

RUN echo "terraform --version"
RUN echo "aws --version"

USER "jenkins"
