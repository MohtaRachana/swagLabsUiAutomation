# Use the official Selenium standalone Chrome image
FROM selenium/standalone-chrome:latest

# Set environment variables to configure Chrome
ENV SCREEN_WIDTH 1920
ENV SCREEN_HEIGHT 1080
ENV SCREEN_DEPTH 24
ENV DISPLAY :99.0

# Set the working directory
WORKDIR /usr/src/app/swaglab

# Copy the project files into the Docker container
COPY . .

# Install Maven
RUN apt-get update && apt-get install -y maven

# Run Maven to build the project and execute tests
RUN mvn clean install -DskipTests

# Entry point to run the tests
ENTRYPOINT ["mvn", "test", "-Dtest=TestEntireFlowRunner"]
