FROM node:latest

ENV VERSION=0.8.8

RUN apt-get update
RUN apt-get install -y unzip

RUN wget http://releases.hashicorp.com/terraform/$VERSION/terraform_$VERSION_linux_amd64.zip
RUN unzip terraform_$VERSION_linux_amd64.zip
RUN mv terraform /usr/bin/

RUN wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

RUN npm install -g yarn
RUN npm install -g serverless

ENTRYPOINT ["/bin/bash", "-c"]
