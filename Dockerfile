# Use the official golang image from Docker Hub
FROM golang:1.22-alpine

# Set the working directory inside the container
WORKDIR /home/shubhbham/ToDo_Application

# Copy the Go modules manifests
COPY go.mod go.sum ./

# Download and install Go dependencies
RUN go mod download

# Copy the entire project directory into the container
COPY . .

# Build the Go application
RUN go build -o main .

# Command to run the executable
CMD ["./main"]
