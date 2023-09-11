# Dockerfile
FROM hashicorp/terraform:latest

# Add any additional dependencies or configurations here

# Create a working directory
WORKDIR /app

# Copy your Terraform code from GitHub into the image
RUN git clone https://github.com/JozzRayan/tf-sample.git /app

# Set any environment variables if needed

# Command to run when the container starts
CMD [ "init"]