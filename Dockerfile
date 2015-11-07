FROM quantumobject/docker-opensimulator
MAINTAINER Giovanni De Gasperis  @giodegas

RUN apt-get update && apt-get install -y redis-server tcpdump netcat vim

#COPY rc.local /etc/rc.local
COPY OpenSim.ini /opt/opensim/bin/OpenSim.ini

RUN mv /etc/redis/redis.conf /etc/redis/redis.conf.org
RUN sed s/"bind 127.0.0.1"/"bind 0.0.0.0"/ /etc/redis/redis.conf.org >/etc/redis/redis.conf

# To add redis deamon to runit		
RUN mkdir /etc/service/redis		
COPY redis.sh /etc/service/redis/run		
RUN chmod +x /etc/service/redis/run

# Redis
EXPOSE 6379/tcp

# Opensimulator
EXPOSE 9000/tcp
EXPOSE 9001/udp

