### add deploy_user

```bash
sudo adduser deploy_user

sudo mkdir -p ~deploy_user/.ssh
touch $HOME/.ssh/authorized_keys
sudo sh -c "cat $HOME/.ssh/authorized_keys >> ~deploy_user/.ssh/authorized_keys"
sudo chown -R deploy_user: ~deploy_user/.ssh
sudo chmod 700 ~deploy_user/.ssh
sudo sh -c "chmod 600 ~deploy_user/.ssh/*"

sudo mkdir -p /apps
sudo chown deploy_user: /apps

sudo -u deploy_user -H bash -l

ssh-keygen -t rsa -C "<your-email-address"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub

```

### Install Postgresql

[source](#https://tecadmin.net/install-postgresql-server-on-ubuntu/)

```bash
sudo apt-get install wget ca-certificates
```

```bash
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
```

```bash
 sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'


 echo autodatastest:LTAI4FpEdXyZymYBJ7eiwoHv:unjJ4QvarqFykAv4gylO5GuXsltaUL > /etc/passwd-ossfs
  ossfs autodatastest /apps/autodatas_production/shared/public/alioss -ourl=http://oss-cn-shanghai-internal.aliyuncs.com -ouid=1001 -ogid=1001 -o allow_other
  https://github.com/aliyun/ossfs/blob/master/README-CN.md
```

```bash
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
sudo apt-get install libmagickwand-dev
sudo apt-get install libpq-dev
```

```bash
sudo su - postgres
psql
```

### create Postgresql user

[source](#https://www.ionos.com/community/hosting/postgresql/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-1604/)

```bash
sudo -u postgres createuser -s jdoe
sudo -u postgres psql
\password jdoe


createuser --p bqdeploy
PGPASSWORD=PaWpromp2t1

PGPASSWORD=PaWpromp2t1 psql bqdeploy  -h 127.0.0.1 -d autodatas_production -f /apps/autodatas_production/shared/vehicle_attributes.sql

createdb -O bqdeploy autodatas_production


docker exec -it cde32468b82e psql -U postgres -d postgres -c "DROP DATABASE autodatas_development;"

docker exec -it cde32468b82e psql -U postgres -d postgres -c "CREATE DATABASE autodatas_development;"
```

### node

```bash
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

apt-get install -y nodejs

apt-get install yarn

```




### install redis

```bash
sudo apt-get install redis-server
sudo systemctl enable redis-server.service

```

### install rvm
- curl -L https://get.rvm.io | sudo bash -s stable
- sudo usermod -a -G rvm <username>


### sidekiq service

- http://ilab.me/howto/run-sidekiq-6-using-systemd/
- /home/deployer/.config/systemd/user/sidekiq.service
- systemctl --user reenable sidekiq

### rails

```bash
rake db:migrate:redo VERSION=20080906120000
```

### mac install ossfs

```bash
https://github.com/aliyun/ossfs/blob/master/README-CN.md

sudo touch /etc/passwd-ossfs
sudo chown sourcod /etc/passwd-ossfs

my-bucket:my-access-key-id:my-access-key-secret

chmod 640 /etc/passwd-ossfs

ossfs bucket-name /tmp/ossfs
```
首先通过id命令获得指定用户的uid/gid信息。例如获取www用户的uid/gid信息：id www
ossfs zipattachments /apps/autodatas_production/shared/public/alioss -ourl=http://oss-cn-shanghai-internal.aliyuncs.com -ouid=1000 -ogid=1000 -oallow_other
ossfs autodatastest /Users/bq/workspace/autodata_app/autodatas/public/alioss -ouid=501 -ogid=20 -o allow_other

sed -i.bak -e s/postgres/bqdeploy/g foo_development.sql
sed -i.bak -e s/bqdeploy/postgres/g foo_development.sql

pg_dump -U bqdeploy -h 127.0.0.1 autodatas_production > /tmp/all_datababse215.sql

cat all_datababse215.sql | docker exec -i cde32468b82e psql -U postgres -d autodatas_development

```bash
  docker exec -t cde32468b82e pg_dump -c -U postgres -d autodatas_development > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
```

# import bug ActiveRecord::NotNullViolation: PG::NotNullViolation: ERROR: null value in column "id" violates not-null constraint

- https://github.com/zdennis/activerecord-import/issues/138

```bash
alter sequence layout_sizes_id_seq owned by layout_sizes.id;
select pg_get_serial_sequence('layout_sizes', 'id');

ActiveRecord::Base.connection.reset_pk_sequence!('layout_sizes')
ActiveRecord::Base.connection.reset_pk_sequence!('vehicles')
ActiveRecord::Base.connection.reset_pk_sequence!('section_coordinates')
ActiveRecord::Base.connection.reset_pk_sequence!('vehicle_attribute_brands')
ActiveRecord::Base.connection.reset_pk_sequence!('vehicle_attributes')

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end



```


### redis clear

docker exec -it  redis-5.0 redis-cli FLUSHALL

# msyql to pgsql

- pgloader ../deploy/mysql_to_pgsql.load



# 浏览数

 - https://ruby-china.org/topics/8484


 # yarn 打包很慢的问题

 - config/deploy.rb 里面的 linked_dirs 有没有把 node_modules 目录加进去
 - yarn config set sass_binary_site http://cdn.npm.taobao.org/dist/node-sass -g



docker run --name postgres5432 -e POSTGRES_PASSWORD=123456 -p 5432:5432 -d postgres


# 计划任务
- 0 1 * * * pg_dump -U postgres autodatas_production > ~/postgres/backups/autodatas_production_$(date +\%Y\%m\%d_\%H\%M\%S).bak




# es update index
- https://medium.com/drover-engineering/background-elastic-search-indexing-using-sidekiq-dd0797d618b9


# SSL 证书
- https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04

# SSL 双向验证

- https://blog.dteam.top/posts/2018-06/nginx-ssl快速双向认证配置脚本.html
- https://blog.imdst.com/nginx-ssl-shuang-xiang-ren-zheng-key-sheng-cheng-he-pei-zhi/