FROM node:16-alpine3.16

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
RUN npm update -g

COPY ./ ./

ENV PORT=80
ENV API_HOST=http://ap-dev-app.312centos.com
EXPOSE 80

CMD npm start
