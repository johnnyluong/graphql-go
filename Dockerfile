# Use an official Go runtime as the base image
FROM golang:1.20

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module manifests
COPY go.mod go.sum ./

# Download the Go module dependencies
RUN go mod download

RUN go mod tidy

# Copy the rest of the application source code
COPY ./ .

# Install any additional dependencies or tools you need
# RUN go get github.com/golang-migrate/migrate/v4/cmd/migrate
# RUN go build -tags 'mysql' -ldflags="-X main.Version=1.0.0" -o $(go env GOPATH)/bin/migrate github.com/golang-migrate/migrate/v4/cmd/migrate/

# Set the command to run when the container starts
CMD ["go", "run", "./server/server.go"]
