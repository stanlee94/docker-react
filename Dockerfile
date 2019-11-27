FROM node:alpine as build-step
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=build-step /app/build /usr/share/nginx/html