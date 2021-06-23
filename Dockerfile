FROM alpine:latest

RUN apk --update add --no-cache bash nano vim nodejs npm

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]