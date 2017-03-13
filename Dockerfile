FROM mhart/alpine-node

RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less unzip openssl && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*

ENV VERSION=0.8.8

RUN wget https://releases.hashicorp.com/terraform/$VERSION/terraform_${VERSION}_linux_amd64.zip && \
    unzip terraform_${VERSION}_linux_amd64.zip && rm terraform_${VERSION}_linux_amd64.zip && \
    mv terraform /usr/bin/

RUN npm install -g yarn serverless

ENTRYPOINT ["/bin/sh", "-c"]
