# build phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# Required for aws ecb
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
