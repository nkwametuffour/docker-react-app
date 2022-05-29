# Build react app to get build content
FROM node:16-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Create image from nginx and copy result of previous build to nginx directory
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html