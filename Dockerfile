From node:alpine as builder
WORKDIR '/app'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run builder
CMD ["npm", "start"]

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html