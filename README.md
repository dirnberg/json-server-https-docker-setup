### README.md for json-server-https-docker-setup

---

# JSON Server HTTPS Docker Setup

This repository enables you to set up a JSON Server with HTTPS support using Docker. It's perfect for local development environments where HTTPS is required for frontend applications to interact with an API securely.

## Steps to Get Started

### Server Setup

Follow these steps to set up and run your secure JSON Server:

1. **Clone the Repository**

    Clone the repository to your local machine:

    ```bash
    git clone https://github.com/dirnberg/json-server-https-docker-setup.git
    ```

2. **Navigate to Certificates Directory**

    Change directory to where we'll store certificates:

    ```bash
    cd json-server-https-docker-setup/certs
    ```

3. **Create Certificates**

    Generate SSL certificates:

    ```bash
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt -config localhost.conf -extensions req_ext
    ```

4. **Start Docker Desktop**

    Ensure that Docker Desktop is running on your system. You can start it from your applications folder/start menu.

5. **Build the Docker Image**

    Build the Docker image with the following command:

    ```bash
    docker build -t json-server-https .
    ```

6. **Run the Docker Container**

    Start the JSON Server in a Docker container:

    ```bash
    docker run --rm -it --name json-server-https-container -p 443:443 json-server-https
    ```

### Client Setup

To interact with the JSON Server from a client:

1. **Add Certificate to Trusted Store**

    Import the `localhost.crt` from certs folder to your system's certificate store to avoid security warnings:

    ```bash
    certutil -addstore -f "Root" localhost.crt
    ```

2. **Test REST API Server**

    Use `curl` to verify that the server is responding over HTTPS:

    ```bash
    curl -v https://localhost:443
    ```

3. **Have Fun With It!**

    You can now interact with your JSON Server securely using any HTTP client or your frontend application.

## Note

This README was written with the assistance of ChatGPT, leveraging its capabilities to provide clear and concise guidance.

## Contributing

Feel free to fork this repository and contribute by submitting pull requests with enhancements to scripts, documentation, or features.

## License

This project is released under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This README is designed to provide users with a step-by-step guide on how to set up a JSON Server with HTTPS support using Docker, including how to interact with it from a client machine, effectively allowing both backend and frontend developers to work in a secure environment.