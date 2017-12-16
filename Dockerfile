## BUILDING
##   (from project root directory)
##   $ docker build -t node-js-for-sethbergman-admin-portal .
##
## RUNNING
##   $ docker run -p 5000:5000 node-js-for-sethbergman-admin-portal
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:5000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/bitnami-containers/minideb-extras:jessie-r14-buildpack

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="z7w3iv3" \
    STACKSMITH_STACK_NAME="Node.js for sethbergman/admin-portal" \
    STACKSMITH_STACK_PRIVATE="1"

# Install required system packages
RUN install_packages libc6 libssl1.0.0 libncurses5 libtinfo5 libsqlite3-0 zlib1g libbz2-1.0 libreadline6 libstdc++6 libgcc1 ghostscript imagemagick libmysqlclient18

RUN bitnami-pkg install node-9.3.0-0 --checksum 1ed17f7c5fd2b57af97ce5549bb642d4df330f4f14d81da3df03f2621b3afc11

ENV PATH=/opt/bitnami/node/bin:/opt/bitnami/python/bin:$PATH \
    NODE_PATH=/opt/bitnami/node/lib/node_modules

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# ExpressJS template
COPY .
WORKDIR /

RUN npm install

EXPOSE 5000
CMD ["npm", "start"]
