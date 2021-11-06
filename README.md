# 自动生成proxychains.conf
## Requirement
- jq
- proxychains4

## How to use
### 获取http代理
> [Github Free Http Proxy](https://github.com/search?o=desc&q=free+http+proxy&s=updated&type=Repositories)
```sh
$ ./get_proxy_list.sh
```
### 检查可用性
生成proxychains.conf
```sh
$ ./check_proxy.sh proxy_list.txt | tee proxychains.conf
```
### 使用proxychains4
```sh
$ proxychains4 curl -s httpbin.org/ip #代理可执行程序
```
