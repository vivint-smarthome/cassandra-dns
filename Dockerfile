# vim:set ft=dockerfile:
FROM cassandra:2.2

ENV GOSU_VERSION 1.7
RUN apt-get update && apt-get install -y dnsutils --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

ENV CASSANDRA_CONFIG /etc/cassandra

COPY cassandra.sh /cassandra.sh
ENTRYPOINT ["/cassandra.sh"]

ENV CASSANDRA_CONFIG /etc/cassandra
VOLUME /var/lib/cassandra

# 7000: intra-node communication
# 7001: TLS intra-node communication
# 7199: JMX
# 9042: CQL
# 9160: thrift service
EXPOSE 7000 7001 7199 9042 9160
CMD ["cassandra", "-f"]
