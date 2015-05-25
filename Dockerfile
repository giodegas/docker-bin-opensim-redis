FROM quantumobject/docker-opensimulator
MAINTAINER Giovanni De Gasperis  @giodegas

RUN apt-get update && apt-get install -y redis-server

COPY rc.local /etc/rc.local
COPY OpenSim.ini /opt/opensim-0.8.1/bin/OpenSim.ini

RUN sed s/"bind 127.0.0.1"/"bind 0.0.0.0"/ /etc/redis/redis.conf.org >/etc/redis/redis.conf

# To add redis deamon to runit		
RUN mkdir /etc/service/redis		
COPY redis.sh /etc/service/redis/unrun		
RUN chmod +x /etc/service/redis/unrun

# Redis
EXPOSE 6379/tcp

# Opensimulator
EXPOSE 9000/tcp
EXPOSE 9000/udp

