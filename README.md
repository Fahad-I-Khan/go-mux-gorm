# User Management API with Go, GORM, PostgreSQL, and Docker

This is a simple user management API built with Go (using the Mux router), GORM ORM, and PostgreSQL. The application provides endpoints to create, update, delete, and fetch users. It also demonstrates how to use Docker for containerizing the application and PostgreSQL database.

## Table of Contents
1. [Tech Stack & Tools](#tech-stack--tools)  
2. [Prerequisites](#prerequisites)  
3. [Technologies Used](#technologies-used)  
4. [Project Structure](#project-structure)  
5. [Installation and Setup](#installation-and-setup)  
6. [API Endpoints](#api-endpoints)  
   - [Example Request (POST /users)](#example-request-post-users)  
7. [Stopping and Removing Containers](#stopping-and-removing-containers)

## Prerequisites

Before running the application, ensure you have the following tools installed:

- **Docker**: To build and run the application and database in containers.
- **Docker Compose**: To manage multi-container Docker applications.

You can download and install Docker and Docker Compose from the official [Docker website](https://www.docker.com/get-started).

## Tech Stack & Tools

![Go](https://img.shields.io/badge/Language-Go-blue) ![Mux](https://img.shields.io/badge/Router-Mux-blue) ![GORM](https://img.shields.io/badge/ORM-GORM-blue)  
![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-blue) ![Docker](https://img.shields.io/badge/Container-Docker-blue) ![Docker Compose](https://img.shields.io/badge/Docker%20Compose-Used-blueviolet)

## Project Structure

- `main.go`: The Go source code for the API.
- `index.html`: A basic HTML front-end for interacting with the API.
- `Dockerfile`: A file to build the Go application container.
- `.dockerignore`: Specifies which files to ignore while building the Docker image.
- `docker-compose.yml`: Defines the services (Go app and PostgreSQL) used in the project.

## Installation and Setup

1. **Clone the Repository**

   First, clone the repository to your local machine:

   ```bash
   git clone https://github.com/Fahad-I-Khan/go-mux-gorm.git
   cd go-mux-gorm
   ```
2. **Build and Run with Docker**

This project uses **Docker** and **Docker Compose** to containerize the Go application and PostgreSQL database. To get everything up and running, follow these steps:

**Step 1: Start PostgreSQL Database**
First, bring up the PostgreSQL container. This will run PostgreSQL in the background:

```bash
docker-compose -d go_db
```
**Step 2: Build the Application**

Build the Go application using Docker Compose:

```bash
docker-compose build
```

**Step 3: Start the Go Application**

Once the build is complete, start the Go application container in detached mode:

```bash
docker-compose up -d go-app
```

**Step 4: Access the API**

The Go application will be running on port` 8000` of your local machine. You can interact with the API via `http://localhost:8000`.

You can also use the provided `index.html` as a simple front-end interface to create, update, delete, and view users. Simply open the `index.html` file in your browser to interact with the API.

## API Endpoints

The API exposes the following endpoints:

1. **GET /users**: Retrieve all users.
2. **GET /users/{id}**: Retrieve a specific user by ID.
3. **POST /users**: Create a new user. You must send `name` and `email` in the request body. GORM ensures that the `email` is unique, and duplicate entries will result in an error.
4. **PUT /users/{id}**: Update an existing user by ID. You must send `name` and `email` in the request body. Note that `email` must remain unique, and attempting to update to a duplicate `email` will result in an error.
5. **DELETE /users/{id}**: Delete a user by ID.

### Example Request (POST /users)

To create a new user, make a` POST` request to `http://localhost:8000/users` with the following JSON body:

```json
{
  "name": "John Doe",
  "email": "john.doe@example.com"
}
```
## Stopping and Removing Containers
Once you're done, you can stop the application and remove the containers using:

```bash
docker-compose down
```
This will stop and remove all running containers, networks, and volumes defined in the `docker-compose.yml`.

### Note 

GORM automatically enforces the uniqueness of the `email` field in the `users` table. If you try to create or update a user with an already existing email, GORM will return a database error.

