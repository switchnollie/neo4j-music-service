FROM neo4j:4.2

ENV NODE_VERSION=14.15.1
# Install nvm
RUN apt update \
  && apt install -y curl \
  && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
# Install Node with nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

# Cleanup
RUN rm -rf /var/lib/apt/lists/* \
  && apt-get -y purge --auto-remove curl

WORKDIR /app
# Install the npm packages
COPY package*.json ./
RUN npm install
COPY . .