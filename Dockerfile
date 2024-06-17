# Use the official Node.js 16 image as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available) to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Bundle app source inside Docker image
COPY . .

# Build the NestJS project (if your project needs a build step)
RUN npm run build

# Your app binds to port 3000 so you'll use the EXPOSE instruction to have it mapped by the docker daemon
EXPOSE 3000

# Define the command to run your app using CMD which defines your runtime
CMD ["npm", "run", "start:prod"]
