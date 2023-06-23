FROM node:16-alpine3.16

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

ENV PORT=80
ENV API_HOST=http://api-svc.dev.svc.cluster.local
EXPOSE 80

CMD npm start
