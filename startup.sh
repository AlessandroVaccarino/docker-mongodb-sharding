docker-compose up -d
echo "Cluster created, waiting it to be correctly initialized"
sleep 60
docker exec -it mongoConfNode1 bash -c "echo 'rs.initiate({_id: \"mongoConfShard1\",configsvr: true, members: [{ _id : 0, host : \"mongoConfNode1\" },{ _id : 1, host : \"mongoConfNode2\" }, { _id : 2, host : \"mongoConfNode3\" }]})' | mongo"
#echo $? # Se 0 ok, altrimenti sleep e riprova
sleep 15
docker exec -it mongorshard1node1 bash -c "echo 'rs.initiate({_id : \"mongorshard1\", members: [{ _id : 0, host : \"mongorshard1node1\" },{ _id : 1, host : \"mongorshard1node2\" },{ _id : 2, host : \"mongorshard1node3\" }]})' | mongo"
sleep 15
docker exec -it mongosNode1 bash -c "echo 'sh.addShard(\"mongorshard1/mongorshard1node1\")' | mongo "
sleep 15
docker exec -it mongosNode1 bash -c "echo 'sh.status()' | mongo "

# Connection String:
#mongo "mongodb://mongorshard1node1:27017,mongorshard1node2.local:27027,mongorshard1node3:27037/?replicaSet=mongorshard1"
#mongo "mongodb://localhost:27017,localhost:27027,localhost:27037/?replicaSet=mongorshard1"