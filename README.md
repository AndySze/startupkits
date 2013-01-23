# Startupkit

创业小工具，帮助创业者在创业道路上一帆风顺。

在线试用：http://startup.taolinggan.com

## 如何使用
1、拷贝代码到本地&&安装gem：
```
git clone git://github.com/AndySze/startupkits.git
cd startupkits
bundle install
```

2、创建数据库 && 运行：
```
rake db:migrate
rails s
```
3、浏览器访问`http://localhost:3000/`即可。

## 部署到正式环境
1、与上面相同；
2、配置自己的数据库，我用的时mysql
```
cp config/database.yml.example config/database.yml
vim database.yml #编辑为自己数据配置
RAILS_ENV=production rake db:create
RAILS_ENV=production rake db:migrate
```
3、配置nginx和unicorn，运行
```
cp config/unicorn.rb.example config/unicorn.rb
cp config/nginx.conf.example config/nginx.conf
vim config/nginx.conf #需要配置网址
ln -nfs $(pwd)/config/nginx.conf /etc/nginx/sites-enabled/startupkits
mkdir -p tmp/pids
touch tmp/pids/unicorn.pid
rake assets:precompile
sudo nginx -s reload #可能需要重启
unicorn -c config/unicorn.rb -E production -D
```
4、访问你的网址。
