# steemd for docker

a Docker build for steemd  
for running a node and mining steem currency  
steemit git repository https://github.com/steemit/steem

## Getting Started
  
These instructions will get you a steemd docker image for mining and using.   
tested on Ubuntu 14.04 
  
### Prerequisities
  
Install Docker, follow the instructions in https://docs.docker.com/linux/step_one/

  
```sh
sudo apt-get update
sudo apt-get install curl git
curl -fsSL https://get.docker.com/ | sh
```
  
### Building

clone this repository  
```sh
git clone https://github.com/blood2/steemd-docker
```
  
build the docker image   
```
cd steemd-docker
build -t steemd .  
```
  

## Edit config.ini

copy the sample file  
  
```sh
cp config-example.ini config.ini
```

edit the config.ini file, change witnesses names and miners's configuration names+keys  
also change seed node's IP if needed, and mining-threads

## Running/Mining

to launch the steemd process to background
```
docker run -d --name=steemit -v `pwd`:/usr/local/steem/witness_node_data_dir steemd
```


## Attaching to docker's output

to attach
```
docker attach --sig-proxy=false steemit
```
CTRL+c will detach the process
