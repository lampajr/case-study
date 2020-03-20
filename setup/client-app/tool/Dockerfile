FROM node:10

WORKDIR /usr/src/tool

RUN npm install -g @toolscip/clisc
RUN npm install -g ajv
RUN clisc init --server --yes
RUN clisc scdl:add --remote 5e74ac60b7084400171eb37f
RUN clisc scdl:add --remote 5e6a70c9acaddc0017bb5c9d

EXPOSE 3001

# Start client-app sever
CMD [ "node", "index.js" ]