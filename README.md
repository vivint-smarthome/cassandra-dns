# Cassandra DNS

A docker container which can pull seed peers from DNS. Builds on the canonical
Cassandra docker image, but adds the following flags:

- `CASSANDRA_SEEDS_DNS` - (ideally) Multi-record DNS record from which to pull seeds.

Also, if you mount a sh sourceable environment file, `/etc/docker-host-env`,
then CASSANDRA_RACK will be defaulted to the value `HOST_ID`.

## Instructions

In order to scale Cassandra properly, you'll want to scale one node, first, get
it healthy. Then, once DNS is working for that node, scale the rest of the
cluster. Seed gossip will take care of cluster discovery from there.

Ideally, your DNS record returns IP addresses for more than one host. If so, be
careful to not scale up faster than max number of records returns by this DNS
entry, or it's possible discovery won't work properly.

