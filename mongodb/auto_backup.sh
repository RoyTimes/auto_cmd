#!bin/sh

# The MIT License (MIT)

# Copyright (c) 2015 Song Zhou

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


DUMP=/usr/local/mongodb/bin/mongodump
OUT_DIR=/home/backup/mongodb/mongod_bak_now
TAR_DIR=/home/backup/mongodb/mongod_bak_list

DATE=`date +%Y_%m_%d`

DB_USER=root #db user name
DB_PASS=adminadmin #db user passwd
DAYS=5 #how long do we keep the backup

TAR_BAK="mongod_bak_$DATE.tar.gz" #name for the backup file

cd $OUT_DIR
rm -rf $OUT_DIR/*
mkdir -p $OUT_DIR/$DATE
mongodump -u $DB_USER -p $DB_PASS -o $OUT_DIR/$DATE 

tar -zcvf $TAR_DIR/$TAR_BAK $OUT_DIR/$DATE #compress 
find $TAR_DIR/ -mtime +$DAYS -delete #del old backups
