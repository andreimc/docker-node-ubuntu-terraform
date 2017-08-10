FROM node

RUN apt-get update && \
    apt-get install make g++ python python-pip python-dev ca-certificates unzip openssl -y -qqq && \
    pip install awscli 

ENV VERSION=0.10.0

RUN wget https://releases.hashicorp.com/terraform/$VERSION/terraform_${VERSION}_linux_amd64.zip && \
    unzip terraform_${VERSION}_linux_amd64.zip && rm terraform_${VERSION}_linux_amd64.zip && \
    mv terraform /usr/bin/

RUN npm install -g serverless

ENTRYPOINT ["/bin/sh", "-c"]
