# Stage 1: Build stage
FROM golang:1.20-alpine AS build

# Setting the working directory inside the container to app
WORKDIR /app

# Coping the Go project files to the container
COPY . .

# Building the Go binary
RUN go build -o app

# Stage 2: Create a minimal runtime image
FROM scratch

# Copying the built binary from the previous stage
COPY --from=build /app/app /app/app
# Set the working directory inside the container
WORKDIR /app

# Exposing the port on which the application will listen
EXPOSE 9090

# Running the Go binary when the container starts
CMD ["./app"]
