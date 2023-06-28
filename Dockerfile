FROM node:16

RUN npm install -g pnpm

WORKDIR /server

COPY .npmrc package.json ./
COPY dist ./
#COPY prisma ./prisma

RUN pnpm install
RUN pnpm install --frozen-lockfile --prod
#RUN pnpm exec prisma generate

EXPOSE 80
CMD [ "pnpm", "start" ]