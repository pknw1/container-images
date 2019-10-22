PWD=$(pwd)
find $PWD -type f -mindepth 2 -maxdepth 2 -iname Dockerfile | sed 's/\/Dockerfile//' |while read -r FILE; do
cd $FILE
TAG=$(echo $FILE | awk -F/ '{print $NF}')
docker build -t pknw1/$TAG .
cd $PWD

done
