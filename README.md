Learning how to build a GraphQL API with gqlgen and Go


### Build Docker Image
```
docker build -t graphql-go .
```

### Run the Container
```
docker run --name graphql-container -p 8080:8080 -d -v $(pwd):/app graphql-go
```

### Or Use Docker Compose
```
docker compose up
docker compose down
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

### Database Migration
Change Credentials and ports accordingly
```
migrate -database "mysql://root:[password]@tcp([mysql server container name])/[database name associated with password]" -path internal/pkg/db/migrations/mysql up
```