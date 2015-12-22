#!bin/sh

chmod +x mongodb.sh
chmod +x auto_backup.sh


mkdir /home/backup/mongodb/mongod_bak_now
mkdir /home/backup/mongodb/mongod_bak_list


echo "30 1 * * * root CMD_HOME/auto_backup.sh" > /etc/crontab

