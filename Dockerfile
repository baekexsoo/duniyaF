### STAGE 1: Build ###

# We label our stage as 'builder'
FROM node:14-alpine as builder
RUN npm install @angular/cli

COPY package*.json ./

RUN npm set progress=false && npm config set depth 0 && npm cache clean --force

RUN npm install

## Storing node modules on a separate layer will prevent unnecessary npm installs at each build
RUN npm i && mkdir /ng-app && cp -R ./node_modules ./ng-app

WORKDIR /ng-app

COPY . .

# RUN npm install typescript@">=3.1.1 <3.3.0"

EXPOSE 4200

## Build the angular app in production mode and store the artifact in dist folder
CMD ng serve --host 0.0.0.0 --disableHostCheck true
