## Notes about ruby

```
$ sudo docker run -v $(pwd):/app ruby:2.6.0-stretch
$ vim Gemfile
```

```
$ touch Dockerfile && touch docker-compose.yml
$ vim Dockerfile
$ vim docker-compose.yml
$ sudo docker-compose build
```

```
$ sudo docker-compose run app rspec --init
$ sudo chgrp -R vagrant .rspec
$ sudo chgrp -R vagrant .rspec
$ sudo chown -R vagrant spec
$ sudo chown -R vagrant spec
$ vim .rspec
```

## RSpec実行方法

```
$ sudo docker-compose run --rm app rspec spec/
```
