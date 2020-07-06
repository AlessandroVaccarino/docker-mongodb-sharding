# MongoDB Sharding Docker

## What is MongoDB Sharding Docker project?
A complete installation of [MongoDB](https://www.mongodb.com/) into a set of Docker containers. Just run using provided shell script and enjoy.

### Run the container

To run your first MongoDB cluster, just type:

`sh ./startup.sh`

The system will invoke a cluster composed by:
- 3 sharding nodes (mongorshard1node1, mongorshard1node2, mongorshard1node3)
- 3 config nodes (mongoConfNode1, mongoConfNode2, mongoConfNode3)
- 2 Mongos nodes (mongosNode1, mongosNode2)

Containers will store relevant data (such as databases) under the root folder of host. In detail:
- Sharding noted will store data under:
  - ./mongoData/shard1/node1
  - ./mongoData/shard1/node2
  - ./mongoData/shard1/node3
- Config nodes will store data under:
 - ./mongoData/shard1/config1
 - ./mongoData/shard1/config2
 - ./mongoData/shard1/config3

To learn how to use MongoDB, please refer to [MongoDB Official Documentation](https://docs.mongodb.com/) page

## 
Thanks to the Docker community for the [Official MongoDB Docker image](https://hub.docker.com/_/mongo), used in the project
