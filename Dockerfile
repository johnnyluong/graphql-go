# Use an official Go runtime as the base image
FROM golang:1.20

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module manifests
COPY go.mod ./

# Download the Go module dependencies
RUN go mod download

RUN go mod tidy

# Copy the rest of the application source code
COPY ./ .

# Install any additional dependencies or tools you need
# For example:
# RUN go get github.com/99designs/gqlgen

# Set the command to run when the container starts
CMD ["go", "run", "server.go"]



# delete everything but docker
# add gqlgen to tool.go
# run the container with just goland and gomod
# connect container to vscode
# start development in the container since we cannot build myysql for go