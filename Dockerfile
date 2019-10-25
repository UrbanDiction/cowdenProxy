FROM node:10.16.3

RUN mkdir /app

RUN apt-get update
RUN npm i npm@latest -g

COPY . /app
WORKDIR /app
RUN npm install && npm cache clean --force
RUN npm run seed:db && npm start
CMD npm start

EXPOSE 8000