#!/bin/bash

# Edit profile file
cd /etc
echo "export NEXUS_PLATFORM=linux-x86-64" >> /etc/profile
echo "export NEXUS_HOME=/usr/local/nexus-2.11.4-01/" >> /etc/profile
echo "export NEXUS_EXEC=$NEXUS_HOME/bin/$NEXUS_PLATFORM" >> /etc/profile
echo "export PATH=$NEXUS_EXEC:$PATH" >> /etc/profile

# Modify the nexus executable
cd /usr/local/nexus-2.11.4-01/bin/
sed -i "23s/.*/RUN_AS_USER='root'/" /usr/local/nexus-2.11.4-01/bin/nexus
sed -i "27s/.*/APP_LONG_NAME='Sonatype Nexus Repository Manager'/" /usr/local/nexus-2.11.4-01/bin/nexus
sed -i "34s/.*/PIDDIR='/var/run'/" /usr/local/nexus-2.11.4-01/bin/nexus

# Copy nexus executable to /etc/init.d
cd /usr/local/nexus-2.11.4-01/bin/
cp nexus /etc/init.d
chmod 755 /etc/init.d/nexus

# Start nexus
cd /usr/local/nexus-2.11.4-01/bin/
./nexus start