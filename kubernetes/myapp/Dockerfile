FROM node:16.9.0-alpine
WORKDIR /app
COPY package.json ./
RUN npm i
COPY index.js /app/
EXPOSE 8083
CMD ["node", "index.js"]

