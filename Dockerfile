# Use the latest Node.js image
FROM node:latest

# Set the working directory
WORKDIR /app

# Install json-server as a local dependency
COPY package.json package-lock.json* ./
RUN npm install json-server

# Add the database JSON file
RUN echo '{"cars":[{"id":1,"brand":"opel","model":"corsa"},{"id":2,"brand":"ford","model":"fiesta"}]}' > db.json

# Copy the SSL certificates
COPY ./certs/localhost.key localhost.key
COPY ./certs/localhost.crt localhost.crt

# Copy the custom HTTPS server script
COPY https-server.js .

# Expose the HTTPS port, e.g., 443 for standard HTTPS
EXPOSE 443

# Start the server with the custom HTTPS script
CMD ["node", "https-server.js"]
