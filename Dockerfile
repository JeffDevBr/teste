FROM node:21-slim

WORKDIR /usr/src/app

COPY client/package*.json ./client/

RUN cd client && npm install

COPY client ./client

RUN cd client && npm run build

RUN npm install -g http-server

WORKDIR /usr/src/app/client

EXPOSE 8080

CMD [ "http-server", "dist", "-p", "8080" ]

