# Using minimal base image
FROM golang:1.20-alpine

# Setting the working directory inside the container to app
WORKDIR /app

# Copy the Go project files to the container 
COPY . .

# Build the Go binary 
RUN go build -o app

# Expose the port on which the application will listen
EXPOSE 9090

# Run the Go binary when the container starts
CMD ["./app"]
