[![Docker Repository on Quay](https://quay.io/repository/jcallen/che-linchpin/status "Docker Repository on Quay")](https://quay.io/repository/jcallen/che-linchpin)


#### Ansible for Eclipse Che

This project includes a Dockerfile (recipe) and stack to be included into Eclipse Che

#### Adding Ansible Stack to Eclipse Che

```bash
wget https://raw.githubusercontent.com/jcpowermac/che-ansible/master/che-ansible.json
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d @che-ansible.json http://localhost:8080/api/stack

```

##### Source

- https://github.com/William-Yeh/docker-ansible/tree/master/alpine3
