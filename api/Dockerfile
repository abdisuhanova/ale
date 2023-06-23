FROM node:16

# Create a dedicated folder for our app
WORKDIR /usr/src/app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install packages
RUN npm install

# Copy the entire source code
COPY ./ ./

# Set environment variables
ENV PORT=3000
ENV DB=postgres://postgres:12345678@database-test.cy32g4owxpjc.us-east-1.rds.amazonaws.com:5432/database

# Expose the port
EXPOSE 3000

# Run the app
CMD npm start

