
export IMAGE_FRONT=$2
export IMAGE_BACK=$1
export DOCKER_USER=$3
export DOCKER_PWD=$4
echo $DOCKER_PWD | docker login -u $DOCKER_USER --password-stdin
docker-compose -f docker-compose.yaml up --detach
echo "success"
