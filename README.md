# 说明

这个仓库中存储的是一个Web环境，包含了完整的LNMP环境，并且支持CTF题目动态Flag。

# 文件说明

在www目录下，放置网站源码。在www目录下，flag.sh是配置动态flag的，db.sql是数据库文件，其余则为网站文件。

在_file目录下，放置的是配置文件，如果不是特别需要，一般不需要更改。

# 部署

`git本仓库`

`在目录下打开shell或者cd到本目录`

`docker-compose build`

`docker-compose up -d`

接着访问127.0.0.1:80即可

# 其他说明

关于docker-compose.yml配置的帮助

```yaml
version: "3"

services:

  web:
    build: .
    image: m0x1n/nginx_mysql_php73 # image名称
    restart: always
    ports:
      - "80:80" # 配置端口
    environment:
      - FLAG=testflag # flag 
```



php读取动态flag：

```yaml
$flag = getenv('FLAG');
if($flag=="not_flag" or $flag==""){
	$flag="qsnctf{test_flag}"; # 测试flag
}
```

接下来就可以输出`$flag`了。

如果您有其他问题，可以选择联系我。本仓库仅提供了一个示例，如果需要运用到使用环境，请修改image名称以免冲突。