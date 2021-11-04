# Indy Node Dockerfile

This Dockerfile makes it possible to run an indy node on openshift using the lastest von-image

## Build

Run 
```
docker build . -t ssi-indy-node
```

# Startup

You need valid pool and domain transactions genesis files as well as an indy_config.py as provided in this repo. Change the default network name 'sandbox' to you network name in that file then run

```
NETWORK_NAME='<your network>'
SEED='<your steward SEED>'
NODE_NAME='<your node name>'
mkdir $NETWORK_NAME
cp pool_transactions_genesis $NETWORK_NAME/
cp domain_transactions_genesis $NETWORK_NAME/
docker run -v --rm $(pwd)/indy_config.py:/etc/indy/indy_config.py -v $(pwd)/$NETWORK_NAME:/var/lib/indy/$NETWORK_NAME  ssi-indy-node init_indy_keys --name $NODE_NAME --seed $SEED
docker run -d -v  $(pwd)/indy_config.py:/etc/indy/indy_config.py -v $(pwd)/$NETWORK_NAME:/var/lib/indy/$NETWORK_NAME  ssi-indy-node

```
