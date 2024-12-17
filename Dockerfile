FROM node:latest AS builder


WORKDIR /app

COPY package.* .

RUN npm install

COPY . .


RUN npm run build


FROM nginx:latest AS production

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD [ "nginx","-g","daemon off;" ]
