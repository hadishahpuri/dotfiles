content=$(curl 'https://bing.biturl.top/?resolution=1920&format=json&index=0&mkt=zh-CN')
url=$(jq -r '.url' <<<"$content")
echo $url
