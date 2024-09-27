# Base Image
FROM golang:1.23.1-alpine

# Make app directory
RUN mkdir /app

# Copy all content to the app directory
ADD . /app

# Make app directory the working directory
WORKDIR /app

# Download any required modules
RUN go mod download

# Build the program to create an executable binary
RUN go build -o webserver .

# Set the startup command
CMD ["/app/webserver"]