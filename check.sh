#!/bin/bash

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

for url in $(cat urls.txt); do
  if curl -s "$url" | grep -q "$KEYWORD"; then
    echo "📌 Found: $url"
  else
    echo "➖ Not found: $url"
  fi
done
