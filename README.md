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
