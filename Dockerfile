FROM node:16

RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm

WORKDIR /server

COPY package.json pnpm-lock.yaml dist ./

RUN pnpm install --frozen-lockfile --prod

expose 80
CMD [ "pnpm", "start" ]