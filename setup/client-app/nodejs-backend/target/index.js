"use strict";

const jayson = require("jayson");

const port = process.env.PORT || 3001;

// create a server
const server = jayson.server({
  ReceiveResponse: function(args, callback) {
    console.log(JSON.stringify(args, null, 2));
    callback(null, "Response received");
  }
});

console.log(`Client server listening on port: ${port}`);
server.http().listen(port);
