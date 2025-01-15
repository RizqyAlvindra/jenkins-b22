FROM node:14

WORKDIR /apps 

COPY . .

RUN npm install sequelize-cli -g

RUN npm install

RUN sequelize db:migrate

EXPOSE 5000

CMD [ "npm", "start" ]
