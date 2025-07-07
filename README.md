<div align="center">

# 🎯 TrendRadar

**你的专属热点助手 —— 让手机只推送你真正关心的新闻**

[![GitHub Stars](https://img.shields.io/github/stars/sansan0/TrendRadar?style=flat-square&logo=github&color=yellow)](https://github.com/sansan0/TrendRadar/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/sansan0/TrendRadar?style=flat-square&logo=github&color=blue)](https://github.com/sansan0/TrendRadar/network/members)
[![License](https://img.shields.io/badge/license-GPL--3.0-blue.svg?style=flat-square)](LICENSE)
[![Python](https://img.shields.io/badge/python-3.7%2B-3776AB?style=flat-square&logo=python&logoColor=ffdd54)](https://www.python.org/)
[![Version](https://img.shields.io/badge/version-v1.3.0-green.svg?style=flat-square)](https://github.com/sansan0/TrendRadar)

[![企业微信通知](https://img.shields.io/badge/企业微信-通知支持-00D4AA?style=flat-square)](https://work.weixin.qq.com/)
[![Telegram通知](https://img.shields.io/badge/Telegram-通知支持-00D4AA?style=flat-square)](https://telegram.org/)
[![dingtalk通知](https://img.shields.io/badge/钉钉-通知支持-00D4AA?style=flat-square)](#)
[![飞书通知](https://img.shields.io/badge/飞书-通知支持-00D4AA?style=flat-square)](https://www.feishu.cn/)
[![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-自动化-2088FF?style=flat-square&logo=github-actions&logoColor=white)](https://github.com/sansan0/TrendRadar)
[![GitHub Pages](https://img.shields.io/badge/GitHub_Pages-部署-4285F4?style=flat-square&logo=github&logoColor=white)](https://sansan0.github.io/TrendRadar)

</div>

>

## ✨ 核心功能

### **全网热点聚合**

## 🔍 支持的平台

## 🚀 使用方式

1. **Fork 本项目**到你的 GitHub 账户

   - 点击本页面右上角的"Fork"按钮

2. **设置 GitHub Secrets（选择你需要的平台）**:

   在你 Fork 后的仓库中，进入 `Settings` > `Secrets and variables` > `Actions` > `New repository secret`，然后根据需要配置以下任一或多个通知平台：

   **💡 提示：** 可以同时配置多个平台，系统会向所有配置的平台发送通知。点击下方对应平台展开详细配置步骤。

   <details>
   <summary>🟡 <strong>企业微信机器人</strong>（配置最简单最迅速）</summary>

   **GitHub Secret 配置：**

   - 名称：`WEWORK_WEBHOOK_URL`
   - 值：你的企业微信机器人 Webhook 地址

   **机器人设置步骤：**

   #### 手机端设置：

   1. 打开企业微信 App → 进入目标内部群聊
   2. 点击右上角"…"按钮 → 选择"群机器人"
   3. 点击"添加" → 点击"新建" → 设置机器人昵称
   4. 复制 Webhook 地址，配置到上方的 GitHub Secret 中

   #### PC 端设置流程类似

   </details>

   <details>
   <summary>🟢 <strong>飞书机器人</strong>（消息显示最友好）</summary>

   **GitHub Secret 配置：**

   - 名称：`FEISHU_WEBHOOK_URL`
   - 值：你的飞书机器人 Webhook 地址

   **机器人设置步骤：**

   1. 电脑浏览器打开 https://botbuilder.feishu.cn/home/my-app

   2. 点击"新建机器人应用"

   3. 进入创建的应用后，点击"流程涉及" > "创建流程" > "选择触发器"

   4. 往下滑动，点击"Webhook 触发"

   5. 此时你会看到"Webhook 地址"，把这个链接先复制到本地记事本暂存，继续接下来的操作

   6. "参数"里面放上下面的内容，然后点击"完成"

   ```json
   {
     "message_type": "text",
     "content": {
       "total_titles": "{{内容}}",
       "timestamp": "{{内容}}",
       "report_type": "{{内容}}",
       "text": "{{内容}}"
     }
   }
   ```

   7. 点击"选择操作" > "发送飞书消息"，勾选 "群消息"，然后点击下面的输入框，点击"我管理的群组"（如果没有群组，你可以在飞书 app 上创建群组）

   8. 消息标题填写"TrendRadar 热点监控"

   9. 最关键的部分来了，点击 + 按钮，选择"Webhook 触发"，然后按照下面的图片摆放

   ![飞书机器人配置示例](_image/image.png)

   10. 配置完成后，将第 5 步复制的 Webhook 地址配置到 GitHub Secrets 中的 `FEISHU_WEBHOOK_URL`
   </details>

   <details>
   <summary>🔵 <strong>钉钉机器人</strong></summary>

   **GitHub Secret 配置：**

   - 名称：`DINGTALK_WEBHOOK_URL`
   - 值：你的钉钉机器人 Webhook 地址

   **机器人设置步骤：**

   1. **创建机器人（仅 PC 端支持）**：

      - 打开钉钉 PC 客户端，进入目标群聊
      - 点击群设置图标（⚙️）→ 往下翻找到"机器人"点开
      - 选择"添加机器人" → "自定义"

   2. **配置机器人**：

      - 设置机器人名称
      - **安全设置**：
        - **自定义关键词**：设置 "热点"

   3. **完成设置**：
      - 勾选服务条款协议 → 点击"完成"
      - 复制获得的 Webhook URL
      - 将 URL 配置到 GitHub Secrets 中的 `DINGTALK_WEBHOOK_URL`

   **注意**：移动端只能接收消息，无法创建新机器人。
   </details>

   <details>
   <summary>🟣 <strong>Telegram Bot</strong>（配置最复杂）</summary>

   **GitHub Secret 配置：**

   - 名称：`TELEGRAM_BOT_TOKEN` - 你的 Telegram Bot Token
   - 名称：`TELEGRAM_CHAT_ID` - 你的 Telegram Chat ID

   **机器人设置步骤：**

   1. **创建机器人**：

      - 在 Telegram 中搜索 `@BotFather`（大小写注意，有蓝色徽章勾勾，有类似 37849827 monthly users，这个才是官方的，有一些仿官方的账号注意辨别）
      - 发送 `/newbot` 命令创建新机器人
      - 设置机器人名称（必须以"bot"结尾，很容易遇到重复名字，所以你要绞尽脑汁想不同的名字）
      - 获取 Bot Token（格式如：`123456789:AAHfiqksKZ8WmR2zSjiQ7_v4TMAKdiHm9T0`）

   2. **获取 Chat ID**：

      **方法一：通过官方 API 获取**

      - 先向你的机器人发送一条消息
      - 访问：`https://api.telegram.org/bot<你的Bot Token>/getUpdates`
      - 在返回的 JSON 中找到 `"chat":{"id":数字}` 中的数字

      **方法二：使用第三方工具**

      - 搜索 `@userinfobot` 并发送 `/start`
      - 获取你的用户 ID 作为 Chat ID

   3. **配置到 GitHub**：
      - `TELEGRAM_BOT_TOKEN`：填入第 1 步获得的 Bot Token
      - `TELEGRAM_CHAT_ID`：填入第 2 步获得的 Chat ID
      </details>

3. **自定义关键词**:

   - 修改`frequency_words.txt`文件，添加你关心的关键词

   <details>
   <summary><strong>⚙️ 点击查看 frequency_words.txt 完整配置教程</strong></summary>

   在 `frequency_words.txt` 文件中配置监控的关键词，支持三种语法和词组功能。

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
