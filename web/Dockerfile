FROM node:16-alpine3.16
WORKDIR /usr/src/app
COPY . .
RUN npm install

ENV PORT=3000
ENV API_HOST=http://api-svc:3000
EXPOSE 3000
CMD npm start

