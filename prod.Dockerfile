FROM node:23-bookworm-slim

WORKDIR /app

COPY ./api/package.json ./api/lock.json ./

RUN yarn

COPY ./api .

RUN yarn build

EXPOSE 3000

CMD ["yarn", "run" , "start"]