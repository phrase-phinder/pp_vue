FROM node:16.13.1 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build

FROM nginx as production-stage
RUN mkdir /app
COPY --from=build-stage /app/dist /app
COPY ssl /etc/nginx/ssl
COPY nginx.conf /etc/nginx/nginx.conf

