FROM node:12
ENV CGO_ENABLED=0

WORKDIR /usr/src/clean-node-api

# Only copy the package.json file to work directory
COPY package.json .

RUN npm install --only=prod

ADD . /usr/src/clean-node-api

RUN npm run build

# Start
CMD [ "npm", "start" ]
EXPOSE 8000