
# Dockerizing a Python Django Application

This document provides a step-by-step guide on how to Dockerize a Python Django application. It includes instructions for creating a Docker image, running the container, and understanding the Dockerfile configuration.

---

## Prerequisites

- Docker should be installed on your system.
- A basic Python Django application with the necessary files (`requirements.txt`, `devops/`, `manage.py`, etc.).

---

## Steps to Dockerize the Django Application

### 1. **Create the Dockerfile**

In your project root, create a `Dockerfile` that contains the following instructions:

```dockerfile
FROM ubuntu

WORKDIR /app

COPY requirements.txt /app/
COPY devops /app/

RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

SHELL ["/bin/bash", "-c"]

RUN python3 -m venv venv1 && \ 
source venv1/bin/activate && \ 
pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD source venv1/bin/activate && python3 manage.py runserver 0.0.0.0:8000
```

#### Explanation of the Dockerfile:

- **`FROM ubuntu`**: This line specifies that the base image is Ubuntu.
- **`WORKDIR /app`**: Sets the working directory inside the container to `/app`.
- **`COPY requirements.txt /app/`**: Copies the `requirements.txt` file into the `/app` directory in the container.
- **`COPY devops /app/`**: Copies the `devops` folder into the `/app` directory.
- **`RUN apt-get update && apt-get install -y python3 python3-pip python3-venv`**: Updates the package lists and installs Python 3, pip, and virtualenv.
- **`SHELL ["/bin/bash", "-c"]`**: Changes the shell to Bash (instead of the default `/bin/sh`), which is required for running `source` to activate the virtual environment.
- **`RUN python3 -m venv venv1 && \ source venv1/bin/activate && \ pip install --no-cache-dir -r requirements.txt`**: Creates a virtual environment `venv1`, activates it, and installs the dependencies from `requirements.txt`.
- **`EXPOSE 8000`**: Exposes port 8000, which is used by the Django application.
- **`CMD source venv1/bin/activate && python3 manage.py runserver 0.0.0.0:8000`**: Activates the virtual environment and starts the Django development server, binding it to all available IPs (i.e., `0.0.0.0`).

---

### 2. **Build the Docker Image**

To build the Docker image from the Dockerfile, run the following command in your terminal:

```bash
docker build -t django-app .
```

This command will build the Docker image with the tag `django-app`.

---

### 3. **Run the Docker Container**

To run the Docker container and map the ports, use the following command:

```bash
docker run -p 8000:8000 django-app
```

#### Explanation of `-p 8000:8000`:

- The first `8000` refers to the **host machine** port.
- The second `8000` refers to the **container** port.
- This means any request made to **localhost:8000** will be forwarded to the Django application running inside the container on port 8000.

---

### 4. **Accessing the Application**

Once the container is running, you can access your Django application by navigating to `http://localhost:8000` in your web browser.

---

## Troubleshooting

- **If Docker is not installed**: Follow the official [Docker installation guide](https://docs.docker.com/get-docker/).
- **If the application does not run**: Make sure the `requirements.txt` file contains all the necessary Python dependencies for the Django app.
- **If the application is not accessible**: Ensure that port 8000 is not being used by another process on your system.

---

## Conclusion

By following these steps, you've successfully Dockerized a Python Django application. You can now deploy this container in any environment that supports Docker, ensuring portability and consistency across development and production environments.

---
