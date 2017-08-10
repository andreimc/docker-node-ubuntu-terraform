FROM mhart/alpine-node:6.11.2

RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less unzip openssl && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*

RUN apk add vips-dev fftw-dev --no-cache --repository https://dl-3.alpinelinux.org/alpine/edge/testing/

RUN apk add --no-cache \
				make \
				g++ 

ENV VERSION=0.10.0

RUN wget https://releases.hashicorp.com/terraform/$VERSION/terraform_${VERSION}_linux_amd64.zip && \
    unzip terraform_${VERSION}_linux_amd64.zip && rm terraform_${VERSION}_linux_amd64.zip && \
    mv terraform /usr/bin/

RUN npm install -g yarn serverless

ENTRYPOINT ["/bin/sh", "-c"]
