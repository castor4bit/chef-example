```sh
$ curl -L https://www.opscode.com/chef/install.sh | sudo bash
$ gem install knife-solo --no-ri --no-rdoc
$ gem install berkshelf  --no-ri --no-rdoc
```

```sh
$ bundle install --path vendor/bundle --binstubs=.bundle/bin
```

```sh
$ mkdir test
$ cd test
$ vagrant init chef/centos-6.5
$ vi Vagrantfile
  ...
  config.vm.network "private_network", ip: "192.168.33.10"

$ vagrant up
$ vagrant ssh-config --host melody >> ~/.ssh/config
```

```sh
$ bundle exec knife solo init chef-repo
$ cd chef-repo
$ bundle exec knife solo prepare melody --bootstrap-version 11.16.0
$ bundle exec knife solo cook melody
```

```sh
$ bundle exec knife solo cook vagrant@192.168.133.10 -o 'role[all]'
```
