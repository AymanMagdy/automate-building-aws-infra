FROM jenkins/jenkins:lts
USER root
EXPOSE 8080

RUN wget --quiet https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip \
  && unzip terraform_0.12.18_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_0.12.18_linux_amd64.zip

RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
  && unzip awscliv2.zip \
  && ./aws/install

USER "jenkins"