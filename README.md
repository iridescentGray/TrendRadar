<div align="center">

# 🎯 TrendRadar

**你的专属热点助手 —— 让手机只推送你真正关心的新闻**

[![GitHub Stars](https://img.shields.io/github/stars/sansan0/TrendRadar?style=flat-square&logo=github&color=yellow)](https://github.com/sansan0/TrendRadar/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/sansan0/TrendRadar?style=flat-square&logo=github&color=blue)](https://github.com/sansan0/TrendRadar/network/members)
[![License](https://img.shields.io/badge/license-GPL--3.0-blue.svg?style=flat-square)](LICENSE)
[![Python](https://img.shields.io/badge/python-3.7%2B-3776AB?style=flat-square&logo=python&logoColor=ffdd54)](https://www.python.org/)
[![Version](https://img.shields.io/badge/version-v1.3.0-green.svg?style=flat-square)](https://github.com/sansan0/TrendRadar)

[![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-自动化-2088FF?style=flat-square&logo=github-actions&logoColor=white)](https://github.com/sansan0/TrendRadar)
[![GitHub Pages](https://img.shields.io/badge/GitHub_Pages-部署-4285F4?style=flat-square&logo=github&logoColor=white)](https://sansan0.github.io/TrendRadar)

</div>

## 父项目

https://github.com/sansan0/TrendRadar

## 启动

### 自定义配置

```shell
cp frequency_words_simple.txt frequency_words.txt
cp config-simple.yaml config.yaml
```

### docker 启动 (先完成自定义配置)

```shell
   docker-compose up -d
```

### 本地启动(先完成自定义配置)

```shell
   uv venv
   source .venv/bin/activate
   uv sync
   python main.py
```

### 📋 基础语法说明

#### 1. **普通关键词** - 基础匹配

```txt
华为
OPPO
苹果
```

**作用：** 新闻标题包含其中**任意一个词**就会被捕获

#### 2. **必须词** `+词汇` - 限定范围

```txt
华为
OPPO
+手机
```

**作用：** 必须同时包含普通词**和**必须词才会被捕获

#### 3. **过滤词** `!词汇` - 排除干扰

```txt
苹果
华为
!水果
!价格
```

**作用：** 包含过滤词的新闻会被**直接排除**，即使包含关键词

### 🔗 词组功能 - 空行分隔的重要作用

**核心规则：** 用**空行**分隔不同的词组，每个词组独立统计

#### 示例配置：

```txt
iPhone
华为
OPPO
+发布

A股
上证
深证
+涨跌
!预测

世界杯
欧洲杯
亚洲杯
+比赛
```

#### 词组解释及匹配效果：

**第 1 组 - 手机新品类：**

- 关键词：iPhone、华为、OPPO
- 必须词：发布
- 效果：必须包含手机品牌名，同时包含"发布"

**匹配示例：**

- ✅ "iPhone 15 正式发布售价公布" ← 有"iPhone"+"发布"
- ✅ "华为 Mate60 系列发布会直播" ← 有"华为"+"发布"
- ✅ "OPPO Find X7 发布时间确定" ← 有"OPPO"+"发布"
- ❌ "iPhone 销量创新高" ← 有"iPhone"但缺少"发布"

**第 2 组 - 股市行情类：**

- 关键词：A 股、上证、深证
- 必须词：涨跌
- 过滤词：预测
- 效果：包含股市相关词，同时包含"涨跌"，但排除包含"预测"的内容

**匹配示例：**

- ✅ "A 股今日大幅涨跌分析" ← 有"A 股"+"涨跌"
- ✅ "上证指数涨跌原因解读" ← 有"上证"+"涨跌"
- ❌ "专家预测 A 股涨跌趋势" ← 有"A 股"+"涨跌"但包含"预测"
- ❌ "A 股成交量创新高" ← 有"A 股"但缺少"涨跌"

**第 3 组 - 足球赛事类：**

- 关键词：世界杯、欧洲杯、亚洲杯
- 必须词：比赛
- 效果：必须包含杯赛名称，同时包含"比赛"

**匹配示例：**

- ✅ "世界杯小组赛比赛结果" ← 有"世界杯"+"比赛"
- ✅ "欧洲杯决赛比赛时间" ← 有"欧洲杯"+"比赛"
- ❌ "世界杯门票开售" ← 有"世界杯"但缺少"比赛"

### 🎯 配置技巧

#### 1. **从宽到严的配置策略**

```txt
# 第一步：先用宽泛关键词测试
人工智能
AI
ChatGPT

# 第二步：发现误匹配后，加入必须词限定
人工智能
AI
ChatGPT
+技术

# 第三步：发现干扰内容后，加入过滤词
人工智能
AI
ChatGPT
+技术
!广告
!培训
```

#### 2. **避免过度复杂**

❌ **不推荐：** 一个词组包含太多词汇

```txt
华为
OPPO
苹果
三星
vivo
一加
魅族
+手机
+发布
+销量
!假货
!维修
!二手
```

✅ **推荐：** 拆分成多个精确的词组

```txt
华为
OPPO
+新品

苹果
三星
+发布

手机
销量
+市场
```

   </details>

4. **自动运行**:

   - 项目已包含`.github/workflows/crawler.yml`配置文件，默认每 50 分钟自动运行一次
   - 你也可以在 GitHub 仓库的 Actions 页面手动触发运行

5. **查看结果**:
   - 运行结果将自动保存在仓库的`output`目录中
   - 同时通过配置的机器人发送通知到你的群组

## 📊 输出示例

### 通知示例：

```
📊 热点词汇统计

🔥 人工智能 AI : 12 条

  1. [百度热搜] 科技巨头发布新AI模型 [1] - 12时30分 (4次)

```

### 消息格式说明

| 格式元素      | 示例                        | 含义         | 说明                                    |
| ------------- | --------------------------- | ------------ | --------------------------------------- |
| **关键词**    | **人工智能 AI**             | 频率词组     | 表示本组匹配的关键词                    |
| : N 条        | : 12 条                     | 匹配数量     | 该关键词组匹配的标题总数                |
| [平台名]      | [百度热搜]                  | 来源平台     | 标题所属的平台名称                      |
| [**数字**]    | [**1**]                     | 高排名标记   | 排名 ≤ 阈值(默认 5)的热搜，红色加粗显示 |
| [数字]        | [7]                         | 普通排名标记 | 排名>阈值的热搜，普通显示               |
| - 时间        | - 12 时 30 分               | 首次发现时间 | 标题首次被发现的时间                    |
| [时间 ~ 时间] | [12 时 30 分 ~ 14 时 00 分] | 时间范围     | 标题出现的时间范围(首次~最后)           |
| (N 次)        | (4 次)                      | 出现次数     | 标题在监控期间出现的总次数              |

## 🔧 高级用法

### 自定义监控平台

```python
ids = [
    ("toutiao", "今日头条"),
    ("baidu", "百度热搜"),
    ("wallstreetcn-hot", "华尔街见闻"),
    ("thepaper", "澎湃新闻"),
    ("bilibili-hot-search", "bilibili 热搜"),
    ("cls-hot", "财联社热门"),
    ("ifeng", "凤凰网"),
    "tieba",
    "weibo",
    "douyin",
    "zhihu",
]
```

## ❓ 常见问题

1. **GitHub Actions 不执行怎么办？**

   - 检查`.github/workflows/crawler.yml`文件是否存在
   - 在 Actions 页面手动触发一次 workflow
   - 确认你有足够的 GitHub Actions 免费分钟数

2. **想要停止手机接收新闻通知消息？**

   - 将`ENABLE_NOTIFICATION`设置为`False`

3. **想要停止在本地继续生成新闻数据？**

   - 将`ENABLE_CRAWLER`设置为`False`

## 📄 许可证

GPL-3.0 License

---
