FROM docker.arvancloud.ir/node:23-alpine AS base

# Install SSH server and other necessary packages
RUN apk add --no-cache openssh bash git

COPY ./linux/package.json /apps/package.json

COPY ./linux/node /apps/linux/node

COPY ./run.sh /apps/run.sh

WORKDIR /apps/

RUN chmod 777 /apps/run.sh

EXPOSE 22  
EXPOSE 3000

CMD ["/bin/sh", "-c", "/apps/run.sh"]