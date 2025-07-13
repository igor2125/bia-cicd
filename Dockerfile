FROM node:22-slim

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --loglevel=error

COPY . .

RUN REACT_APP_API_URL=http://localhost:3001 SKIP_PREFLIGHT_CHECK=true npm run build --prefix client \
  && mv client/build build \
  && rm -rf client/* \
  && mv build client/

EXPOSE 8080

CMD [ "npm", "start" ]

