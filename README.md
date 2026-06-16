# apicheck

快速检测 AI 服务商 API Key 是否可用的 CLI 工具。纯 Python 标准库，零依赖，跨平台。

## 支持的服务商 (16 个)

| 服务商 | Key 格式 | API 端点 |
|--------|----------|----------|
| OpenAI | `sk-...` | api.openai.com/v1 |
| Anthropic | `sk-ant-...` | api.anthropic.com |
| Google Gemini | `AIza...` | generativelanguage.googleapis.com/v1beta |
| DeepSeek | `sk-...` | api.deepseek.com |
| Groq | `gsk_...` | api.groq.com/openai/v1 |
| Together AI | 64位字符串 | api.together.xyz/v1 |
| Mistral AI | 32位字母数字 | api.mistral.ai/v1 |
| OpenRouter | `sk-or-...` | openrouter.ai/api/v1 |
| Moonshot | `sk-...` | api.moonshot.cn/v1 |
| Zhipu (智谱) | `id.secret` | open.bigmodel.cn/api/paas/v4 |
| Qwen/DashScope | `sk-...` | dashscope.aliyuncs.com/compatible-mode/v1 |
| SiliconFlow | `sk-...` | api.siliconflow.cn/v1 |
| Fireworks AI | `fw_...` | api.fireworks.ai/inference/v1 |
| Cohere | 40位字母数字 | api.cohere.com |
| **Mimo Token Plan** | `tp-...` | token-plan-cn.xiaomimimo.com/v1 |
| **Mimo API** | `sk-...` | api.xiaomimimo.com/v1 |

## 安装

### 方式一：脚本安装

```bash
git clone <repo> ~/apicheck
cd ~/apicheck && bash install.sh
```

### 方式二：手动安装

```bash
cp apicheck /usr/local/bin/apicheck
chmod +x /usr/local/bin/apicheck
```

### 方式三：直接运行

```bash
python3 apicheck --help
```

## 使用

```bash
apicheck sk-xxxx...                    # 检测单个 Key
apicheck tp-xxxx...                    # Mimo Token Plan
apicheck sk-xxx... sk-ant-xxx...       # 检测多个 Key
apicheck --batch keys.txt              # 从文件批量检测
apicheck -q --batch keys.txt           # 只显示可用的 Key
apicheck --provider deepseek sk-xxx    # 指定服务商
apicheck --json sk-xxx                 # JSON 输出
echo "sk-xxx" | apicheck -             # 管道输入
```

## 输出状态

| 图标 | 含义 |
|------|------|
| ✅ | 可用 |
| ❌ | 无效 Key |
| ⚠️ | 速率限制 (429) |
| 💰 | 额度用完 |
| 🔥 | 服务端错误 |
| ❓ | 未知状态 |

## 霓虹动画

当检测到 Key 可用时，会显示霓虹灯光动画：

```
  检测结果: ⚡⚡⚡ 恭喜可用 ⚡⚡⚡  — 共 1 个 Key 可用!
```

动画会循环切换背景颜色（红、黄、绿、青、蓝、品红），持续约 2 秒后定格。

## 代理支持

自动检测代理（按优先级）：

1. 环境变量: `HTTPS_PROXY` / `HTTP_PROXY` / `ALL_PROXY`
2. macOS 系统代理 (Wi-Fi SOCKS)

手动指定：

```bash
HTTPS_PROXY=socks5h://127.0.0.1:7892 apicheck sk-xxx
```

## 环境变量

| 变量 | 说明 |
|------|------|
| `NO_COLOR` | 禁用彩色输出 |
| `HTTPS_PROXY` | HTTPS 代理 |
| `HTTP_PROXY` | HTTP 代理 |
