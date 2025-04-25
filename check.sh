#!/bin/sh

KEYWORD="$1"

if [ -z "$KEYWORD" ]; then
  echo "❗ Please specify a keyword to search for."
  echo "Usage: $0 \"keyword_to_search\""
  exit 1
fi

if [ ! -f urls.txt ]; then
  echo "❗ File 'urls.txt' not found."
  exit 1
fi

while IFS= read -r url; do
  if curl -s "$url" | grep -q "$KEYWORD"; then
    echo "📌 Found: $url"
  else
    echo "➖ Not found: $url"
  fi
done < urls.txt
