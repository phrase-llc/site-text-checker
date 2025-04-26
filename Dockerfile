# ベースイメージ
FROM alpine:latest

# 必要なパッケージをインストール
RUN apk add --no-cache curl grep

# 作業ディレクトリ作成
WORKDIR /app

# スクリプトとデータファイルをコピー
COPY check.sh .
COPY urls.txt .

# スクリプトに実行権限を付与
RUN chmod +x check.sh

# エントリーポイント
ENTRYPOINT ["./check.sh"]