FROM node:23-bookworm-slim

WORKDIR /app

COPY ./api/package.json ./api/yarn.lock ./

RUN yarn

COPY ./api .

RUN yarn run build

EXPOSE 3000

CMD ["yarn", "run" , "start"]