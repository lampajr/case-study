FROM node:10

WORKDIR /usr/src/tool

RUN npm install -g @toolscip/clisc
RUN npm install -g ajv
RUN clisc init --server --yes

EXPOSE 3001

CMD [ "node", "index.js" ]