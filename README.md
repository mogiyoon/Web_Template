-----

# Web Server Template

### A Full-Stack Environment for a Quick Start

This template provides an **all-in-one web server starter**, configured with three ready-to-run servers: **Vite (Frontend)**, **NestJS (Real-Time Server)**, and **Spring Boot (API Server)**.

You can set up your complete development environment with a single command, no complex configuration required.

-----

## 🚀 Core Features

### 1\. Ready-to-Run Environment

  - Easily run each server using the interactive shell script (**`dc.sh`**) or Makefile.
  - Supports integrated execution with **Docker Compose** when needed.
  - CORS, DB, network, and port settings are already fully configured, so no modifications are necessary.

### 2\. Easy Environment Configuration

  - **NestJS**: Copy the `env_example` file, rename it to `.env`, and it's ready to use.
  - **Spring Boot**: Copy the `properties_example` file and configure it as `application.properties`.

**Examples:**

```env
# apps/real-time-server/.env
DB_HOST=host.docker.internal
DB_PORT=5432
DB_NAME=db_name
DB_USER=db_user
DB_PASS=db_pass
DB_SSL=false
NODE_ENV=development
```

```properties
# apps/api-server/src/main/resources/application.properties
spring.datasource.url=jdbc:postgresql://host.docker.internal:5432/db_name
spring.datasource.username=username
spring.datasource.password=password
spring.datasource.driver-class-name=org.postgresql.Driver
```

-----

## 💻 How to Run

### 1\. Run with Shell Script (Recommended)

This template includes an interactive execution script named `dc.sh`.

```bash
# Grant execution permission (only once)
chmod +x dc.sh

# Run the script
./dc.sh
```

### 2\. Run with Makefile Shortcut (Optional)

A shortcut is provided for those familiar with Makefiles.
Running the command below will execute the `./dc.sh` script from method 1.

```bash
# Run the interactive script
make build
```

When you run the script, the following menu will appear:

```
-------------------------------
Select target to build and run (with real-time logs):
  1) frontend
  2) real-time-server
  3) api-server
  a) all
  q) quit
-------------------------------
Select a number:
```

  - Enter a **number** to build, run, and view logs for that specific server.
  - Enter **`a`** to run all servers simultaneously.
  - Enter **`q`** to quit.

**Example Flow:**

```bash
$ ./dc.sh
Select a number: 1
🚀 docker compose up --build frontend
[+] Building frontend ...
[+] Running frontend on http://localhost:5174
```

Simply make a selection from the menu to run the servers and view their real-time logs.

-----

### 3\. Run Directly with Docker Compose

If needed, you can also run all servers as integrated Docker containers.

```bash
# Build and run all servers
docker compose up --build

# Or, run a specific server
# Frontend only
docker compose --profile frontend up --build
# Real-time server only
docker compose --profile real-time-server up --build
# API server only
docker compose --profile api-server up --build
```

All servers are automatically connected within the same network (**`my-app-network`**).
You can access each service by navigating to `http://localhost:<port>` in your browser.

-----

## ⚙️ Default Configuration

| Item | Description |
| :--- | :--- |
| **CORS** | Both NestJS and Spring Boot are configured to allow requests from the frontend dev server (`http://localhost:5174`). <br> Sending credentials and all standard HTTP methods are permitted. |
| **DB Connection** | Ready to connect to external databases like Postgres/MySQL (examples included in the template). |
| **Network** | All containers are automatically connected via the `bridge`-based `my-app-network`. |
| **Hot Reload** | The `frontend` and `api-server` automatically reflect code changes. |

-----

## 🧱 Basic Folder Structure

```
apps/
├── frontend/             # Vite-based Frontend
├── real-time-server/     # NestJS Real-Time Server
│   └── env_example       # Environment variable example
└── api-server/           # Spring Boot API Server
    └── properties_example  # Configuration file example
```

-----

## 🚀 Why Use This Template?

This template is designed to eliminate complex setup processes, allowing developers to focus immediately on building core features.

#### ⏰ Start Developing Immediately

  - **Near-Zero-Config Experience**: Troublesome infrastructure settings like CORS, DB, and networking are already complete. Just `git clone` and start coding.
  - **Integrated Full-Stack Environment**: The frontend, API server, and real-time server are organically linked, making it easy to test and develop a microservice architecture (MSA).

#### 💻 Superior Developer Experience

  - **Interactive Execution Script**: The `dc.sh` script menu allows you to select and run any server instantly and check logs without needing to know Docker commands.
  - **Fast Development Cycle**: Maximize your development speed with Hot Reload, which reflects code changes instantly, and profile-based execution for running only the servers you need.

#### 🚢 Stable Deployment and Operation

  - **Dev-Prod Parity**: By using a Docker-based development environment, this template prevents deployment errors caused by discrepancies between local and production environments.

-----

## 📜 License

**MIT**