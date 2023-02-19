FROM node:16.13-alpine as build
WORKDIR /app
COPY / ./
COPY package*.json ./

RUN npm install -g @angular/cli && \
    npm install && \
    ng build
COPY . .

FROM nginx:alpine
WORKDIR /app
COPY --from=build /app/dist/frontend /usr/share/nginx/html
