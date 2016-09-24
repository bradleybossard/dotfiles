pushd .
cd ~/src
for i in $(seq 1 3); do
  json=`curl https://api.github.com/users/bradleybossard/repos?per_page=100\&page=$i`
  clone_urls=`echo $json | jq '.[].clone_url' | sed 's/"//g'`
  echo $clone_urls
  for url in $clone_urls; do
    echo git clone $url
  done
done
popd
