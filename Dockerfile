FROM node:20-alpine

WORKDIR /app

# Copy package files
COPY react-storefront/package.json react-storefront/pnpm-lock.yaml ./

# Install pnpm and dependencies
RUN npm install -g pnpm
RUN pnpm install --frozen-lockfile

# Copy all source code
COPY react-storefront/ .

# Build the application
RUN pnpm run build

# Expose port
EXPOSE 3000

# Start the application
CMD ["pnpm", "start"]