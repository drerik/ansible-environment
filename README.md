# ansible-environment

Ansible environment in a container. Default Container engine is podman.

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
export ANSIBLE_ENVIRONMENT_EXTRAS=""
```
### Local ssh key

Mount you ssh key into the ansible-environment

```bash
export ANSIBLE_ENVIRONMENT_EXTRAS="$ANSIBLE_ENVIRONMENT_EXTRAS -v $HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub:ro
```

### Ansible Collections

Mount your local ansible collection (" $HOME/Workspace/ansible/ansible-collections ") into your ansible-environment.

```bash
export ANSIBLE_ENVIRONMENT_EXTRAS="$ANSIBLE_ENVIRONMENT_EXTRAS -v $HOME/Workspace/ansible/ansible-collections:/workspace/collections/ansible_collections -e ANSIBLE_COLLECTIONS_PATHS=/workspace/collections"
```

### Custom ansible-environment container image

You can create your own ansible-environment image by extending the original `ghcr.io/drerik/ansible-environment:main` image, then in your .ansible-envrionment export the `ANSIBLE_ENVIRONMENT_IMAGE` variable with your own image

```bash
export ANSIBLE_ENVIRONMENT_IMAGE=ghcr.io/drerik/ansible-environment:main
```

### Use docker instead of podman as container engine

To change the container engine to docker, you can configure the `CONTAINER_RUNTIME` environment variable

```bash
export CONTAINER_RUNTIME=docker
```

If you need to run docker with sudo, you can set the `CONTAINER_RUNTIME` like this:

```bash
export CONTAINER_RUNTIME=sudo docker
```

## Usefull commands

### Encrypt ansible_password with vault

```bash
echo -n "the plaintext to encrypt" | ansible-vault encrypt_string --stdin-name "ansible_password"
```
