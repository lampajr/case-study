FROM node:10

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY target/package*.json ./

RUN npm install

# Bundle app source
COPY target/. .

EXPOSE 3000

CMD [ "node", "index.js" ]