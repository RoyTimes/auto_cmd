#!/bin/sh

# All rights reserved 2015 @zs (github.com/RoyTimes)

DUMP=/usr/local/mongodb/bin/mongodump
OUT_DIR=/home/backup/mongodb/mongod_bak_now
TAR_DIR=/home/backup/mongodb/mongod_bak_list

DATE=`date +%Y_%m_%d`

DB_USER=root #db user name
DB_PASS=adminadmin #db user passwd
DAYS=7 #how long do we keep the backup

TAR_BAK="mongod_bak_$DATE.tar.gz" #name for the backup file

cd $OUT_DIR
rm -rf $OUT_DIR/*
mkdir -p $OUT_DIR/$DATE
mongodump -u $DB_USER -p $DB_PASS -o $OUT_DIR/$DATE 


find $TAR_DIR/ -mtime +$DAYS -delete #del old backups
