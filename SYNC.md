# GitHub 为主 · GitLab 镜像跟随

本目录为 **展示型仓库**（`ym321com/ym321-platform`），不含源码。

**README 语言：** 默认中文 [`README.md`](./README.md) · 英文 [`README.en.md`](./README.en.md)

---

## 1. 仓库策略（GitHub 在前）

```
本地 git-showcase
    ↓ 只 push
GitHub（主仓库）https://github.com/ym321com/ym321-platform
    ↓ Pull Mirror（自动）
GitLab（镜像，只读跟随）
```

| 原则 | 说明 |
|------|------|
| **只改 GitHub** | 本地 commit 后 `git push origin main` |
| **GitLab 不单独维护** | 用 Pull Mirror，不要 `git push gitlab` |
| **外链只指向 GitHub** | 官网、TG、README 均推 GitHub 链接 |
| **GitLab Description** | 可加：`Mirror of https://github.com/ym321com/ym321-platform` |

### GitLab 同步（无 Pull Mirror 时用双 push）

GitLab 免费版通常只有 Push Mirror，**无法**从 GitHub 自动拉取。  
改用脚本同时推送到 GitHub + GitLab：

```powershell
cd git-showcase
.\scripts\push-both.ps1
# 或附带提交信息：
.\scripts\push-both.ps1 -Message "Update skin previews"
```

| Remote | 地址 |
|--------|------|
| `origin` | https://github.com/ym321com/ym321-platform.git |
| `gitlab` | https://gitlab.com/ym321com/ym321-platform.git |

脚本会自动添加 `gitlab` remote（若不存在）。**先推 GitHub，再推 GitLab。**

---

## 2. 日常推送

```powershell
cd git-showcase

git config user.name "ym321com"
git config user.email "noreply@ym321.com"

# 推荐：双 push（GitHub + GitLab）
.\scripts\push-both.ps1 -Message "你的提交说明"

# 或仅推 GitHub（已有 commit）
git push origin main
```

> 建议在 **系统 PowerShell / Git Bash** 中 commit，避免 Cursor 注入 `Co-authored-by`。

---

## 3. GitHub 仓库设置（必做）

### Description（About 栏，中文为主）

```
云码平台 YM321 — 娱乐平台/BC系统源码，AG/PG 30+厂商，H5+PC+App+代理。7天上线 · iGaming casino source · ym321.com
```

### Website

```
https://ym321.com
```

### Topics（复制粘贴）

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

### GitHub Pages

Settings → Pages → Branch: `main` → Folder: `/docs`

### Social Preview

上传 `assets/skins/phone/KY1.png` 或 `assets/logo.png`

---

## 4. 更新皮肤图片

```powershell
.\scripts\sync-assets.ps1
git add assets/ docs/assets/
git commit -m "Update skin preview assets"
git push origin main
```

---

## 5. 引流链路

```
搜索「娱乐平台源码 / casino source code」
  → GitHub README（中文默认）/ Pages
  → Telegram / WhatsApp
  → ym321.com 深度了解
```

---

## 6. 联系方式

| 渠道 | 值 |
|------|-----|
| Telegram | @ym321com |
| WhatsApp | https://wa.me/601128730884 |
| 官网 | https://ym321.com |
| **主仓库** | https://github.com/ym321com/ym321-platform |
| **GitLab 镜像** | https://gitlab.com/ym321com/ym321-platform |
