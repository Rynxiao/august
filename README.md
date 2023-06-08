## august

App 八月 是由胡先生(Ryn)线下开发。

主要由于市面上一些应用太多广告。其中，主要的功能包括万年历、简单的天气预报以及生活小常识等模块，后续功能敬请期待...

### 运行
首先将`.env.sample`改为`.env`，然后将其中的值替换为自己的。

天气使用的是和风天气，每日都有免费的配额，如果是自己用足够了；

拉取常识是自己搭建了一个express服务，如果不考虑部署，直接在本地采用localhost就可以了，后端服务的工程在下面，使用docker-compose运行起来即可。

```shell
WEATHER_API_KEY={和风天气 ApiKey}
SENSE_BACKEND_URL={Your backend url}
```

### 一些命令

```shell
# 更新splash页面，更新玩颜色以及背景图片后，运行以下命令
flutter clean && flutter pub get && flutter pub run flutter_native_splash:create

# 安装release版本到app上
flutter run --release --no-sound-null-safety
```

### 一些问题

- 因为起初只是为了给自己用，所有有些内容的高度没有做适配
- 天气模块，下拉回弹不是特别顺畅

### TODO

- 日历中提醒的数据同步、备份
- 版本未做控制
- 在日历事件快要到的时候消息推送提醒 (本来打算用firebase，无奈被q，不搭梯子国内用不了)
- 常识内容想要用爬虫脚本定时处理，手动添加有点麻烦
- 添加GPT机器人（后话，token过期了，目前虚拟信用卡建得有点麻烦）

### 后端repo

[august-backend](https://github.com/Rynxiao/august-backend)
