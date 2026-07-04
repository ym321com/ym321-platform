# GitHub + GitLab 双平台同步与 SEO 设置

本目录为 **展示型仓库**（`ym321/ym321-platform`），不含源码。

## 1. 初始化并推送

```powershell
cd git-showcase
git init
git add .
git commit -m "YM321 casino platform showcase — screenshots, keywords, GitHub Pages"
git branch -M main
git remote add github git@github.com:ym321/ym321-platform.git
git remote add gitlab git@gitlab.com:ym321/ym321-platform.git
git push -u github main
git push -u gitlab main
```

## 2. GitHub 仓库设置（必做 — 影响搜索曝光）

### Description（About 栏）

```
Casino & sports betting platform source — AG PG EVO SABA, H5 PC App, agent system. iGaming / BC system. 娱乐平台源码
```

### Website

```
https://ym321.com
```

### Topics（最多 20 个，复制粘贴）

```
casino
betting-platform
igaming
white-label
sportsbook
laravel
agent-system
casino-source-code
online-casino
gambling-platform
pg-soft
ag-gaming
live-casino
slots
affiliate-system
bc-system
娱乐平台
ym321
mobile-casino
h5-casino
```

### Social Preview（Settings → General → Social preview）

上传 `assets/skins/phone/KY1.png` 或 `assets/logo.png`（竖屏 H5 截图更清晰，勿用 PC 合成图）。

### GitHub Pages（Settings → Pages）

| 项 | 值 |
|----|-----|
| Source | Deploy from a branch |
| Branch | `main` → `/docs` |

启用后访问：`https://ym321.github.io/ym321-platform/`（Org 名按实际调整）

Pages 落地页：`docs/index.html` — 含完整皮肤画廊 + TG/WhatsApp CTA + SEO keywords。

### Discussions

开启 Discussions，分类：`💬 Sales Inquiry`

## 3. GitLab 镜像（可选）

GitLab → Settings → Repository → Mirroring → Pull from GitHub  
URL: `https://github.com/ym321/ym321-platform.git`

## 4. 更新皮肤图片

```powershell
.\scripts\sync-assets.ps1
git add assets/ docs/assets/
git commit -m "Update skin preview assets"
git push github main
```

## 5. 引流链路

```
Google / GitHub 搜索 "casino source code laravel"
  → README / GitHub Pages（含 BC/casino 关键词 + 截图）
  → 点击 Telegram / WhatsApp
  → 或进 ym321.com 深度了解
```

## 6. 联系方式

| 渠道 | 值 |
|------|-----|
| Telegram | @ym321com |
| WhatsApp | [Chat →](https://wa.me/601128730884)（号码已配置，页面不展示） |
| 官网 | https://ym321.com |

QQ / 微信待二期。

## 7. 后续可选：多仓库关键词矩阵

| 仓库名 | 瞄准搜索词 |
|--------|-----------|
| `ym321-platform` | 主品牌（当前） |
| `casino-white-label-laravel` | white label casino laravel |
| `igaming-agent-system` | affiliate / agent system |

内容 80% 复用，README 侧重不同关键词。
