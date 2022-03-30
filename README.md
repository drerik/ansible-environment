# ansible-environment

Ansible environment in a docker container.

## Install
```bash
sudo curl https://raw.githubusercontent.com/drerik/ansible-environment/main/ansible-environment | sudo tee /usr/local/bin/ansible-environment
sudo chmod 755 /usr/local/bin/ansible-environment
```

## Configuration

Configuration can be set globaly by creating a bash source file. The script will look for the following files in this order and source them:

- `~/.ansible-environment`: Global config for all your all ansible environments
- `~/.ansible-environment-$PWD`: Local config per envirionment. Add your environement specifics for that project. $PWD is your projects work folder.
- `.ansible-environment`: Project specific config. If your inventory is located inside the project structure, you can define `ANSIBLE_INVENTORY` here.

These two environments variables can be set here.

- `ANSIBLE_INVENTORY`: Path to ansible inventory
- `ANSIBLE_ENVIRONMENT_EXTRAS`: Extra container parameters ( volumes, environnment variables etc. )

Example:

```bash
export ANSIBLE_INVENTORY=$HOME/projects/ansible/inventory
export ANSIBLE_ENVIRONMENT_EXTRAS="-e OS_CLOUD=mycloud -v $HOME/.config/openstack/clouds.yaml:/runner/.config/openstack/clouds.yaml:ro"
```


### Ansible Collections

## Usefull commands

### Encrypt ansible_password with vault

```bash
echo -n "the plaintext to encrypt" | ansible-vault encrypt_string --stdin-name "ansible_password"
```
