FROM node:18-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y bash && \
    npm install -g ccusage@latest && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["ccusage"]
