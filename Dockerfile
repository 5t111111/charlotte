FROM node:0.10

MAINTAINER yochiyochirb https://github.com/yochiyochirb

RUN adduser --gecos 'hubot' --disabled-password --home /hubot hubot

USER hubot
WORKDIR /hubot

COPY package.json /hubot/package.json

RUN npm install

COPY ["external-scripts.json", "hubot-scripts.json", "/hubot/"]
COPY scripts/* /hubot/scripts/

ENV PATH "node_modules/.bin:node_modules/hubot/node_modules/.bin:$PATH"
# ENV HUBOT_IDOBATA_API_TOKEN xxxxxxxx
# Otherwise set an api token like the following when running container
# -e HUBOT_IDOBATA_API_TOKEN=xxxxxxxx
ENV HUBOT_NAME charlotte

ENTRYPOINT ["hubot", "-a", "idobata"]
