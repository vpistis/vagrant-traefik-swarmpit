# Traefik Swarmpit Vagrant

This is a simple Vagrantfile which can be used to spin few nodes with latest Docker stable installed.
You can play with [Docker Swarm](https://docs.docker.com/engine/swarm/), [Swarmpit](https://swarmpit.io/) 
and [Traefik proxy](https://doc.traefik.io/traefik/) on it.
Boxes are Ubuntu Focal amd64.

# Customize

By default `vagrant up` spins up 3 machines: `manager`, `worker1`, `worker2`. You can adjust how many
workers you want in the `Vagrantfile`, by setting the `numworkers` variable. 
Manager, by default, has address "172.168.10.2", workers have consecutive ips. 

```ruby
numworkers = 2
```

If your provisioner is `Virtualbox`, you can modify the vm allocations for memory and cpu by changing these variables:

```ruby
vmmemory = 2048
```

```ruby
numcpu = 1
```

`/etc/hosts` on every machine is populated with an IP address and a name of every other machine, 
so that names are resolved within the cluster. 
This mechanism is not idempotent, reprovisioning will append the hosts again.

# Play

Swarmpit dashboard is exposed to `888` port and Trafik dashboard on `8080` port of the Vagrant `manager` node.
Vagrant `manager` is exposed using private and public network. The public network should be attached to the same network
of the host machine, check the `manager` ip address by using:

```shell script
vagrant ssh manager
vagrant@manager:~$ ip address
```

When you have the `manager` ip you can browse to `http://manager-ip:888` and `http://manager-ip:8080`.

# Traefik Proxy
The docker-compose file run Traefik and Web demo, you can customize the compose file to run other services and test.
Refer to [Traefik proxy](https://doc.traefik.io/traefik/) official doc.

# License 

MIT

# Author 
Strongly inspired by `https://github.com/tdi/vagrant-docker-swarm` repo. 

Valentino Pistis @vpistis
