FROM node:16
# dedicated foulder for our app
WORKDIR /usr/src/app
# copy the source code
COPY package*.json ./

# install packages
RUN npm install

COPY ./ ./

ENV PORT=3000
ENV DB=postgresql://postgres:12345678@database-test.cy32g4owxpjc.us-east-1.rds.amazonaws.com:5432/database
EXPOSE 3000
# run the app
CMD npm start
