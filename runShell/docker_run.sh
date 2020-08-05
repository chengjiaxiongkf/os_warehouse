#!/bin/bash
echo =======docker run start=======
echo =======param 1:$1=============
echo =======param 2:$2=============
echo =======param 3:$3=============
echo =======param 4:$4=============
a="";
if [ "${4}"x = "Y"x ]
then
	echo "Y";
	a="--restart=always";
fi
echo =======run context: docker run --name $1$2 -d -p $2:$2 -e server.port=$2 -v /root/config/java/log/$1:/log ${a} $1:$3
docker run --name $1$2 -d -p $2:$2 -e server.port=$2 -v /root/config/java/log/$1:/log ${a} $1:$3
echo =======docker run end=======