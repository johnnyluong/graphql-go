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
Change Credentials and ports accordingly. You only need to run this once to create the migration tables
```
migrate -database "mysql://root:[password]@tcp([mysql server container name])/[database name associated with password]" -path internal/pkg/db/migrations/mysql up
```

### Creating Migrations
todo: replace with lib/ps
```
go get -u github.com/go-sql-driver/mysql
go build -tags 'mysql' -ldflags="-X main.Version=1.0.0" -o $GOPATH/bin/migrate github.com/golang-migrate/migrate/v4/cmd/migrate/
cd internal/pkg/db/migrations/
migrate create -ext sql -dir mysql -seq create_[new table name]_table
```
Define the SQL commands in the .up file. When the server is started, new migrations will occur automatically