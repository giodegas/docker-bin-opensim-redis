FROM quantumobject/docker-opensimulator
MAINTAINER Giovanni De Gasperis  "giovanni@giodegas.it"

RUN apt-get update && apt-get install -y redis-server

ADD rc.local /etc/rc.local
ADD OpenSim.ini /opt/opensim-0.8.1/bin/.

# Redis
EXPOSE 6379/tcp

# Opensimulator
EXPOSE 9000/tcp
EXPOSE 9000/udp

