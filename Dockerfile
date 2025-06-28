FROM node:18-slim

WORKDIR /app

# 日本語環境（任意）
ENV LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
    LC_ALL=ja_JP.UTF-8

# bash + ccusage をグローバルインストール
RUN apt-get update && \
    apt-get install -y bash && \
    npm install -g ccusage@latest && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ccusage 実行（npx 不要）
CMD ["ccusage"]

