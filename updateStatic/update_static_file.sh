#!/bin/bash
echo ===go to /root/gitfile/web====
cd /root/gitfile/web
echo ==============================
echo =======[start update]=========
echo ==============================
git reset --hard
git pull origin master
echo ==============================
echo =======[end update]=========
echo ==============================