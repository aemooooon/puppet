# SystemAdmin
## Puppet

### Initialization
1. First time to set up this backups repository procedures(on group21mgmt.foo.org.nz):

```bash
cd /etc/puppet
git init
echo "Hello, puppet" >> README.md
git add .
git commit -m "first time to add init file"
git remote add origin git@github.com:aemooooon/puppet.git
git push -u origin master
```

the only things it should becareful that the permisson, all command line might be need sudo and the .git/config file need change user or group to current operation user(hua).

```bash
sudo chown -R hua:hua ./.git
sudo chmod 755 config
```

2. when any change, update in the future just need git add and push.
