# site-text-checker

指定した文字列がリスト内の各URLに含まれているかチェックするシェルスクリプト

## 前提

- curl コマンドがインストールされていること

## 使い方

1. urls.txt を作成してチェック対象のURLを1行ずつ書く

   ```text
   https://example.com/page1
   https://example.com/page2
   http://localhost/page3
   http://localhost:8080/page4
   ```

2. スクリプトに実行権限を付与

    ```bash
   chmod +x check.sh
    ```

3. チェックしたい文字列を引数にしてスクリプトを実行

    ```bash
   ./check.sh "探したい文字列"
    ```

   結果をファイルに保存したい場合はリダイレクト

    ```bash
   ./check.sh "探したい文字列" > result.log
    ```

## 注意点

- 引数で文字列がないとエラー
- urls.txt が同じディレクトリに必要
- ページ内のHTMLタグも対象になるので表示テキストとは異なる

## Dockerを使う場合
- 検索対象のURLが同一ホストの別のDockerで実行されていて `urls.txt` に `http://localhost` が含まれているときは `http://host.docker.internal` に変更する必要があります。
- Linuxで実行する場合は、`host.docker.internal` が使えないため、Dockerfileを使わず `curl` をインストールして直接実行することをお勧めします。
- Dockerfile を使ってコンテナをビルド

    ```bash
   docker build -t keyword-checker .
    ```
- コンテナを実行

    ```bash
    docker run --rm keyword-checker "探したい文字列"
     ```
