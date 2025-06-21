# Consistent Hashing Cache Cluster with NGINX

This project is a simulation of a cache cluster using NGINX with consistent hashing, consisting of a router, two cache nodes, and a simple backend (httpbin).

## Project Structure

```
.
├── docker-compose.yml
├── Makefile
├── test_consistency.sh
├── cache/
│   ├── Dockerfile
│   └── nginx.conf
├── router/
│   ├── Dockerfile
│   └── nginx.conf
```

## How to Run

### 1. Build & Start All Services

```sh
make up
```

### 2. View Logs

```sh
make logs
```

### 3. Stop All Services

```sh
make down
```

### 4. Clean Docker Resources

```sh
make clean
```

### 5. Consistency Test

Run the following script to test request distribution to cache nodes:

```sh
./test_consistency.sh
```

## Components

- **router/**: NGINX as a load balancer with consistent hashing to the cache cluster.
- **cache/**: NGINX as cache nodes, storing responses from the backend.
- **backend**: Uses [kennethreitz/httpbin](https://hub.docker.com/r/kennethreitz/httpbin) as a simple backend simulation.

## Architecture

```
Client
  |
  v
[nginx-router] --(hash)--> [cache-a] --+
                    |                  |
                    +-----> [cache-b]--+--> [backend]
```

## Notes

- Access port: `http://localhost:7447`
- The `X-Node` header in the response indicates which cache node served the request.
- Cache and key hashing configuration are aligned for consistent routing between router and cache nodes.

---

License: MIT