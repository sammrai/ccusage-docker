FROM node:18-slim AS builder

WORKDIR /app

RUN npm install -g ccusage@latest


FROM node:18-slim

COPY --from=builder /usr/local/lib/node_modules/ /usr/local/lib/node_modules/

ENV PATH="/usr/local/bin:$PATH"

WORKDIR /usr/local/lib/node_modules/ccusage


COPY --from=builder /usr/local/ /usr/local/

CMD ["ccusage"]