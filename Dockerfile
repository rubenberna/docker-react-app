# Build phase

FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Run phase. By writing a second FROM statement, we specify a second running block 

FROM nginx

# copy something from another phase. The destination needs to be that particular folder, as specified by nginx docs in docker hub
COPY --from=builder /app/build /usr/share/nginx/html