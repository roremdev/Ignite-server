FROM node:16

RUN npm install -g pnpm

WORKDIR /server

COPY .npmrc package.json pnpm-lock.yaml ./
COPY dist ./
#COPY prisma ./prisma

RUN pnpm install --frozen-lockfile --prod
#RUN pnpm exec prisma generate

EXPOSE 80
CMD [ "pnpm", "start" ]