FROM node:11.3-alpine as builder
WORKDIR /app
COPY package.json .
RUN yarn install
COPY  . .
RUN yarn build


FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html



