# debian_dev_docker
## setup
```
cp ssh_config/id_ed25519.keep ssh_config/id_ed25519
```
```
cat ~/.ssh/id_ed25519 > ssh_config/id_ed25519
```
```
sh dockerbuild.sh
```
```
sh rundocker.sh
```