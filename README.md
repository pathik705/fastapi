# fastapi-example

A simple example of using Fast API in Python.

## Preconditions:

- Python 3

## Run local

### Install dependencies

```
pip install -r requirements.txt
```

### Run server

```
uvicorn app.main:app --reload
```

## Run with docker

### Build docker image

```
docker build -t my-fastapi-app:1.0 .
```

### Run container

```
docker run --name my-fastapi-container -d -p 8000:8000 my-fastapi-app:1.0
```

### Tagging docker image to push to docker hub

```
docker tag <image-id> <docker-hub-username>/<image-name>:<tag>
docker tag my-fastapi-app:1.0 jayanth00003/my-fastapi-app:1.0
```

### Log in to Docker Hub

```
docker login
```

### Push image to docker hub

```
docker push <docker-hub-username>/<image-name>:<tag>
docker push jayanth00003/my-fastapi-app:1.0
```

## API documentation (provided by Swagger UI)

```
http://127.0.0.1:8000/docs
```