# マルチステージビルド: ビルドステージ
FROM node:18-alpine AS builder

WORKDIR /app

# ccusageをグローバルインストール
RUN npm install -g ccusage@latest

# 実行ステージ: 最小サイズのAlpineイメージ
FROM node:18-alpine AS runner

# 必要最小限のパッケージのみインストール
RUN apk add --no-cache bash

# ビルドステージからccusageをコピー
COPY --from=builder /usr/local/lib/node_modules/ccusage /usr/local/lib/node_modules/ccusage
COPY --from=builder /usr/local/bin/ccusage /usr/local/bin/ccusage

# 作業ディレクトリ設定
WORKDIR /app

# ccusage実行
CMD ["ccusage"]