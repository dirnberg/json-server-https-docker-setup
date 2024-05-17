const jsonServer = require('json-server');
const https = require('https');
const fs = require('fs');

const server = jsonServer.create();
const router = jsonServer.router('db.json'); // Use your JSON file
const middlewares = jsonServer.defaults();

// HTTPS options with the SSL certificate and key
const httpsOptions = {
  key: fs.readFileSync('localhost.key'),
  cert: fs.readFileSync('localhost.crt')
};

server.use(middlewares);
server.use(router);

const PORT = 443; // Standard HTTPS port
https.createServer(httpsOptions, server).listen(PORT, () => {
  console.log(`JSON Server is running securely on https://localhost:${PORT}`);
});
