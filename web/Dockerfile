FROM node:16-alpine3.16
WORKDIR /usr/src/app
COPY . .
RUN npm install

ENV PORT=80
ENV API_HOST=http://api-svc.dev.svc.cluster.local:3000
EXPOSE 80
CMD npm start

