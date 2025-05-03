FROM node:22-alpine AS build

WORKDIR /client

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build

FROM nginx:alpine AS production

COPY --from=build /client/dist /etc/nginx/html

COPY container_configs/nginx_templates /etc/nginx/templates

EXPOSE 80