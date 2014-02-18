# Docker container with metasploit.
#
# Use Kali the latest Kali Linux base image
FROM linux/kali
MAINTAINER Tom Eklöf "tom@linux-konsult.com"

ADD ./init.sh /init.sh

# update sources.list to aliyun
RUN bash -c 'echo "deb http://mirrors.aliyun.com/kali kali main" > /etc/apt/sources.list'
# Install metasploit
RUN apt-get -y update ; apt-get -y --force-yes install libnokogiri-ruby metasploit-framework

# Attach this container to stdin when running, like this:
# docker run -t -i linux/kali/metasploit
CMD /init.sh
