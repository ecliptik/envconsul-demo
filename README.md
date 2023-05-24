# Vault, Kubernetes, and Envconsul Demo

## Install Tailscale

We will use Tailscale to expose the EC2 vault instance over a Tailnet, so we can interact with it outside of the SSM console on a laptop.

Instance will have a public IP, but no public security group.

https://tailscale.com/kb/1052/install-amazon-linux-2/

```
sudo yum install yum-utils
sudo yum-config-manager --add-repo https://pkgs.tailscale.com/stable/amazon-linux/2/tailscale.repo
sudo yum install tailscale
sudo systemctl enable --now tailscaled
```

Access system via SSH and configure with `tailscale up`

## Vault

### Install Vault

Amazon Linux 2

https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-install

```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install vault
```

### Setting up Vault

Start vault in dev mode on `0.0.0.0` interface so it's available on all interfaces (Private ip, public IP, tailscale IP)

https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-dev-server

```
vault server -dev -dev-listen-address=0.0.0.0:8200
```

Copy Unseal and Token.

Setup env vars for shell

```
export VAULT_ADDR='http://$TAILSCALEIP:8200'
export VAULT_TOKEN="hvs.$VAULTTOKEN"
```

Add basic secrets

https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-first-secret

```
vault kv put -mount=secret sinatra AWS_KEY_ID=aws_keyid AWS_SECRET_KEY_ID=super_secret_keyid
```

## Envconsul

After Vault is setup, test out envconsul.

```
brew install envconsul
```

Configure vault address and token in `config.hcl` and access secrets from Vault

```
envconsul -config="./config.hcl" -secret="secret/sinatra" env
```

Will print out the entire shell env, but include secretsa as well,

```
🚀→ envconsul -config="./config.hcl" -secret="secret/sinatra" env | grep -i secret
2023-05-23T16:10:06.388-0700 [WARN]  envconsul: (clients) disabling vault SSL verification
secret_AWS_KEY_ID=aws_keyid
secret_AWS_SECRET_KEY_ID=super_secret_keyid
```

## Kubernetes

Create EKS cluster using `terraform/eks`.

Export AWS keys

```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=us-east-1
```

After cluster creation, create local `kubectl` configuration.

```
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
```

Apply configmap and deployment which will run envconsul in an init container, copy it to the binary to `/envconsul` in the sinatra container and use the configmap to communicate with vault and create env vars.

## Testing Env Var Exposure

Expected behavior.

Host and Container env vars should be exposed, and only exposed at the container/app level.

### Host

If using Amazon Linux 2, find the container id of the running sinatra and envconsul processes. Check these in `/var/lib/containers` and `/proc` for the PID and check for exposed env vars `AWS_KEY_ID` and `AWS_SECRET_KEY_ID`.

### Container

Shell into the pod/container running on EKS with `kubectl exec -it pod-id -c sinatra` and run `env` to check for exposed env vars `AWS_KEY_ID` and `AWS_SECRET_KEY_ID`

### App

The sinatra app will return the ENV vars for `foo` and `excited` as plaintext when htting the endpoint on `/environment`.


