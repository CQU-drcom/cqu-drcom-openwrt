# 重庆大学上网登陆 for OpenWRT

提供了开箱即用的重庆大学 drcom 配置和服务。

## 安装

依赖于不在软件源中的包 [`micropython-drcom-with-lib`](https://github.com/CQU-drcom/micropython-drcom/releases) 需提前手动下载并安装。

之后即可安装 `cqu-drcom` 包。

## 使用

### 登陆方式

校区的设置有 `a`（A 区）、`b`（B 区）、`huxi`（虎溪校区）三种，以下以 `huxi` 为例：

``` bash
uci set drcom.@login[0].protocol=huxi
uci commit
```

设置用户名和密码：

``` bash
uci set drcom.@login[0].username='20xxxxxx'
uci set drcom.@login[0].password='xxxxx'
uci commit
```

图形化操作：TODO

### drcom 服务

启动 drcom 服务：

```
/etc/init.d/drcomctl start
```

关闭 drcom 服务：

```
/etc/init.d/drcomctl stop
```

使 drcom 开机启动：

```
/etc/init.d/drcomctl enable
```

## 如何从源码构建 ipk 包

链接或复制该文件夹到 [OpenWrt SDK](https://openwrt.org/docs/guide-developer/using_the_sdk) 的 `package/cqu-drcom-openwrt`，在 OpenWrt SDK 目录运行

```bash
make package/cqu-drcom-openwrt/compile
```

之后便可在 `bin/packages/*/base/` 下得到 `cqu-drcom` ipk 包。


