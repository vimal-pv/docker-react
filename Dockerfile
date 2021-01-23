# FROM node:alpine as builder
# WORKDIR '/app'
# COPY package.json .
# RUN npm install
# COPY . .
# RUN npm run build

# FROM nginx
# COPY --from=builder /app/build /usr/share/nginx/html
# EXPOSE 80

FROM node:alpine

WORKDIR "/app"

COPY package.json .

RUN npm install

# we can commment this as we have mapped pwd code to containers code or we can as it is.
COPY . . 

CMD ["npm", "run", "start"]
EXPOSE 3000