# SystemAdmin
## Puppet
### Initialization
First time to set up this backups repository procedures(on group21mgmt.foo.org.nz): <br>

```bash
cd /etc/puppet
git init
echo "Hello, puppet" >> README.md
git add .
git commit -m "first time to add init file"
git remote add origin git@github.com:aemooooon/puppet.git
git push -u origin master
```

In addition, I have add some base user information: <br>

```bash
sudo git config user.name "hua" 
sudo git config user.email "hua@group21mgmt@foo.org.nz"
```
and also put the public key of group21mgmt@foo.org.nz to my github Key Management Center.

the only things it should becareful that the permisson, all command line might be need sudo and the .git/config file need change user or group to current operation user(hua).

```bash
sudo chown -R hua:hua ./.git
sudo chmod 755 config
```

when any change on modules of puppet, just use command below to backup: <br>

```bash
git add .
git commit -m "update description"
git push
```

PS: Do not update anything on github online
