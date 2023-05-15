### Build Docker Image
```
docker build -t graphql-go .
```

### Run the Container
```
docker run --name graphql-container -p 8080:8080 -d -v $(pwd):/app graphql-go
```

### Access the Container's Shell
```
docker exec -it graphql-go /bin/bash
```

### Restart the Container to load changes
```
docker restart graphql-container
```

### Notes
GraphQL server does not support hot reload, so you must restart the server or container manually to apply changes to resolvers