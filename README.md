# docker-handson-demoapp
# Node.js + MongoDB Docker Hands-On

A hands-on project to learn how a Node.js application connects to a MongoDB database running inside Docker containers.

## Project Overview

This project contains a simple Node.js and Express application that retrieves user data from MongoDB.

MongoDB and Mongo Express run as Docker containers connected through a custom Docker network. The Node.js application currently runs locally on the host machine and connects to MongoDB through the exposed MongoDB port.

## Architecture

```text
Browser
   |
   | http://localhost:5050/getUsers
   v
Node.js + Express Application (running locally)
   |
   | mongodb://admin:qwerty@localhost:27017
   v
Host Port 27017
   |
   v
MongoDB Container ───────── Mongo Express Container
        \                    /
         \                  /
          └─ mongo-network ┘
```

## Docker Network

A custom Docker network named `mongo-network` is used for communication between the MongoDB and Mongo Express containers.

Both containers are attached to the same network, so Mongo Express can connect to MongoDB using the MongoDB container name as the hostname.

```text
Mongo Express → mongo:27017 → MongoDB
```

Here, `mongo` is the MongoDB container name. Docker's internal DNS resolves this name to the MongoDB container's IP address.

## Technologies Used

* Node.js
* Express.js
* MongoDB
* Mongo Express
* Docker
* Docker Compose
* Git and GitHub

## Project Structure

```text
docker-testapp/
│
├── public/
│   ├── index.html
│   └── style.css
│
├── server.js
├── package.json
├── package-lock.json
├── mongodb.yaml
├── .gitignore
└── README.md
```

## Prerequisites

Make sure the following are installed:

* Node.js
* Docker Desktop
* Git

## Install Dependencies

Open a terminal in the project folder and run:

```bash
npm install
```

This installs the dependencies listed in `package.json`.

## Start MongoDB and Mongo Express

The MongoDB and Mongo Express setup is defined in `mongodb.yaml`.

Run:

```bash
docker compose -f mongodb.yaml up -d
```

Check running containers:

```bash
docker compose -f mongodb.yaml ps
```

## Access Mongo Express

Open the following URL in your browser:

```text
http://localhost:8081
```

Mongo Express provides a web interface to view MongoDB databases and collections.

## Run the Node.js Application

Start the application using:

```bash
npm start
```

The server runs on:

```text
http://localhost:5050
```

## Test the API

To fetch all users from MongoDB, open:

```text
http://localhost:5050/getUsers
```

If the `users` collection is empty, the API returns:

```json
[]
```

## MongoDB Connection

The Node.js application connects to MongoDB using:

```text
mongodb://admin:qwerty@localhost:27017
```

This works because:

* The Node.js application runs locally on the host machine.
* MongoDB container port `27017` is mapped to host port `27017`.
* The application can therefore access MongoDB through `localhost:27017`.

## Key Docker Concepts Practiced

* Pulling Docker images
* Running MongoDB in a container
* Running Mongo Express in a container
* Creating and using a custom Docker network
* Container-to-container communication using container names
* Docker internal DNS
* Port mapping
* Environment variables
* Docker Compose
* Connecting a local Node.js application to a containerized MongoDB database
* Managing project code with Git and GitHub

## Useful Commands

```bash
# Start MongoDB and Mongo Express
docker compose -f mongodb.yaml up -d

# View running services
docker compose -f mongodb.yaml ps

# View logs
docker compose -f mongodb.yaml logs -f

# Stop and remove containers
docker compose -f mongodb.yaml down

# Start Node.js server
npm start
```

## Future Improvements

* Containerize the Node.js application using a Dockerfile.
* Run the Node.js application, MongoDB, and Mongo Express together using Docker Compose.
* Connect the Node.js container to MongoDB using `mongo` as the hostname.
* Use environment variables through a `.env` file.
* Add create, update, and delete user APIs.
* Add persistent Docker volumes for MongoDB data.
