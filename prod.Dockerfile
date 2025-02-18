FROM node:23-alpine3.20 as build

WORKDIR /app

COPY ./api/package.json ./api/yarn.lock ./

RUN yarn

COPY ./api .

RUN yarn run build

FROM node:23-alpine3.20

WORKDIR /app

# Copia os arquivos de dependências para garantir que package.json e yarn.lock estejam presentes
COPY --from=build /app/package.json /app/yarn.lock ./

# Instala somente as dependências de produção (remove os devDependencies)
RUN yarn install --production --frozen-lockfile && yarn cache clean

COPY --from=build /app/dist ./dist

EXPOSE 3000

CMD ["yarn", "run" , "start:prod"]
