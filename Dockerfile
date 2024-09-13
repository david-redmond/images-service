# Use a lightweight Node.js image as base
FROM node:16-alpine3.18

# Set the working directory in the container
WORKDIR /usr/src

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

ENV PUBLIC_URL=""
ENV PORT=8013

# Copy the rest of the application code to the working directory
COPY . .

RUN npm run build

EXPOSE 8013
# Start the application
CMD ["node", "./dist/index.js"]

