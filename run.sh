ssh_key='c:\users\kiselki\.ssh\id_rsa'
content=$(<"$ssh_key")
echo $content

docker build -t test . --build-arg SSH_PRIVATE_KEY="$content"