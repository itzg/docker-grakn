This Docker image packages the [GRAKN.AI](https://grakn.ai/) knowledge graph database
in a way that it can be deployed and scaled alongside backing Cassandra and
ZooKeeper containers.

# Quick Usage

Run

```
docker-compose up -d
```

using this `docker-compose.yml` file:

```
version: "3"

services:
  zookeeper:
    image: jplock/zookeeper:3.4.9
    volumes:
      - "zookeeper:/tmp/zookeeper"
  cassandra:
    image: cassandra:2.1.9
    volumes:
      - "cassandra:/var/lib/cassandra"
  grakn:
    image: itzg/grakn
    ports:
      - "4567:4567"

volumes:
  cassandra:
  zookeeper:
```

With that you can continue with the [quick start](https://grakn.ai/pages/documentation/get-started/quickstart-tutorial.html) and related material by
exec'ing into the grakn container:

```
docker-compose exec grakn bash
```
