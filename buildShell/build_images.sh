#!/bin/bash
echo ========================================================
echo =====================[beifen file]======================
echo ========================================================
for i in $@
do
	echo =====old $i jar go to /root/jar=====
	[ -f /root/gitfile/cjxProject/$1/src/main/docker/$1.jar ] && mv -f /root/gitfile/cjxProject/$1/src/main/docker/$1.jar /root/gitfile/os_warehouse/jar/ || echo warning:no old file
done
echo =================[go to cjxProject]=====================
cd /root/gitfile/cjxProject
echo ========================================================
echo =====================[maven clean]======================
echo ========================================================
mvn clean
echo ========================================================
echo =====================[download file]====================
echo ========================================================
echo ===== git pull new file =====
#git fetch origin
#git clean -f
#git reset --hard origin/master
git pull origin master
echo ========================================================
echo =====================[package]==========================
echo ========================================================
for i in $@
do
		echo ===######===packag [$i] start===#####===
		echo =====start package $i=====
		cd /root/gitfile/cjxProject
		mvn package -pl $i -am
		echo =====  end package $i=====
		
		echo =====new jar go to /root/gitfile/cjxProject/$i/src/main/docker/=====	
		mv -f /root/gitfile/cjxProject/$i/target/$i.jar /root/gitfile/cjxProject/$i/src/main/docker/$i.jar
		
		echo =====go ot /root/gitfile/cjxProject/$i/src/main/docker/=====
		cd /root/gitfile/cjxProject/$i/src/main/docker
		
		echo =====start build images go to docker=====
			echo =====images version `date +%Y%m%d`=====
			docker build -t $i:`date +%Y%m%d` .
		echo =====end build images go to docker=====
		echo ===#####===packag [$i] end===#####===
done