# Start with the official Go image
FROM golang:1.20

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod ./
COPY go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source code into the container
COPY . .

# Install golangci-lint
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

# Command to run when starting the container
CMD ["golangci-lint", "run", "./..."]
