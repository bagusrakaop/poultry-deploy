cd /home/ubuntu/poultry-deploy
git pull origin main
git submodule update --init --recursive
docker ps -q | xargs -r docker stop
docker ps -aq | xargs -r docker rm
docker images -q | xargs -r docker rmi -f
docker volume ls -q | xargs -r docker volume rm
docker compose up --build -d