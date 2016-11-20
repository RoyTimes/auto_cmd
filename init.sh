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

# Set up vars
OUT_DIR=/home/backup/mongodb/mongod_bak_now
TAR_DIR=/home/backup/mongodb/mongod_bak_list
PUBLIC_IP=123.56.124.92
CMD_HOME=~

# apt-get basic software
apt-get install -y curl vim g++ git

# set up zsh
apt-get install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# setup runtime for node
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
apt-get install nodejs npm build-essential


# setup mongodb 
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
apt-get install -y mongodb-org

# initialize path
mkdir /home/backup
mkdir /home/backup/mongodb
mkdir /home/backup/mongodb/mongod_bak_now
mkdir /home/backup/mongodb/mongod_bak_list

# set iptables
sudo iptables -t nat -A PREROUTING -d $PUBLIC_IP -p tcp --dport 80 -j DNAT --to $PUBLIC_IP:8080

# set up auto backup
echo "30 1 * * * root $CMD_HOME/auto_backup.sh" >> /etc/crontab

