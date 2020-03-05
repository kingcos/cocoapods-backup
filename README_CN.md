# cocoapods-backup

[README in English](README.md)

[cocoapods-backup](https://rubygems.org/gems/cocoapods-backup) 是一个帮助你简单「备份」Pod 以运行的 CocoaPods 插件。

## 用途

当我们在 `Podfile` 中声明一个 `pod 'SomePod'` 时，表示我们需要引入该 Pod 并集成至相应的 Targe；当执行 `pod install` 时，CocoaPods 将执行解析依赖关系、下载依赖、校验 Target、生成 Pods 工程等步骤。这时如果无法连接到网络（或者远程库在不便于连接的内网），那么使用该插件即可将原本联网获取的 Pod 库通过**本地路径**依赖。

## 安装

您可以直接安装该插件：

```shell
$ gem install cocoapods-backup
```

亦可将其声明在您所在项目的 `Gemfile` 中：

```ruby
gem 'cocoapods-backup'
```

## 使用

```ruby
pod 'AFNetworking',
    :git => 'git@github.com:AFNetworking/AFNetworking.git',
    :tag => '2.6.3',
    :backup => true # 标志该 Pod 优先以本地备份源码为主
```

## 版本

详见 [Release 页面](https://github.com/kingcos/cocoapods-backup/releases)。
