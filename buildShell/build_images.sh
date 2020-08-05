#!/bin/bash
echo ==========packag $i start==========
echo =====go to cjxProject  =====
cd /root/gitfile/cjxProject
echo ===== git pull new file =====
git pull origin master
for i in $@
do
		echo =====start package $i=====
		mvn clean package -pl $i -am
		echo =====  end package $i=====
		echo =====old jar go to /root/jar=====
		[ -f /root/gitfile/cjxProject/$1/src/main/docker/$1.jar ] && mv -f /root/gitfile/cjxProject/$1/src/main/docker/$1.jar /root/gitfile/os_warehouse/jar/ || echo warning:no old file
		
		echo =====new jar go to /root/gitfile/cjxProject/$i/src/main/docker/=====	
		mv -f /root/gitfile/cjxProject/$i/target/$i.jar /root/gitfile/cjxProject/$i/src/main/docker/$i.jar
		
		echo =====go ot /root/gitfile/cjxProject/$i/src/main/docker/=====
		cd /root/gitfile/cjxProject/$i/src/main/docker
		
		echo =====start build images go to docker=====
			echo =====images version `date +%Y%m%d`=====
			docker build -t $i:`date +%Y%m%d` .
		echo =====end build images go to docker=====
done
echo ==========packag $i end==========