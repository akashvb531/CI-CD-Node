# Use Node.js image from your ECR (not Docker Hub)
FROM public.ecr.aws/docker/library/node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first (for better layer caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY server.js .

# Expose port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
