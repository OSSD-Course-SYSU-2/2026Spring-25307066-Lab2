# 校园失物招领系统 - 鸿蒙应用
基于 HarmonyOS ArkTS 开发的校园失物招领平台，实现寻物启事和失物招领信息的发布与展示，支持手机、平板、大屏等多设备自适应布局。

## 📱 功能特性
- **寻物启事**：查看丢失物品列表，包含物品名称、时间、地点、联系电话、酬金、备注等信息
- **失物招领**：查看拾到物品列表，包含物品名称、时间、地点、联系电话、备注等信息
- **发布信息**：用户可选择发布寻物启事或失物招领，填写详细表单
- **搜索功能**：首页支持物品信息搜索（UI 完成，数据对接待完善）
- **图片/视频占位**：每条信息左侧预留图片/视频区域（图标自动匹配物品类型）
- **多端适配**：响应式布局，自动识别手机、平板、折叠屏等设备

## 🎨 页面说明
| 页面 | 文件名 | 功能 |
|------|--------|------|
| 首页 | Index.ets | 标题、搜索框、功能入口卡片、发布按钮 |

<img width="235" height="515" alt="0" src="https://github.com/user-attachments/assets/da7a6d5e-9b58-4103-b7e8-68518b4bc2dc" />
<img width="236" height="514" alt="1" src="https://github.com/user-attachments/assets/428650c2-b3f5-4952-9f72-c6ce9c74b441" />
<img width="239" height="514" alt="4" src="https://github.com/user-attachments/assets/ad5b1849-bacd-41b8-96c4-62683306de15" />

| 寻物列表 | LostList.ets | 展示所有寻物启事，青色边框，物品图标 |

<img width="233" height="517" alt="2" src="https://github.com/user-attachments/assets/795f077c-f166-4fbe-8bf0-8d0482cfaa9b" />

| 招领列表 | FindList.ets | 展示所有失物招领，黄色边框，物品图标 |

<img width="238" height="515" alt="3" src="https://github.com/user-attachments/assets/8f77a971-5c98-4186-a6ea-bd4072ba8c5e" />

| 发布寻物 | LostAdd.ets | 表单：物品名称、时间、地点、电话、酬金、备注 |

<img width="236" height="517" alt="5" src="https://github.com/user-attachments/assets/0fb2f9d7-1d8f-4a58-ba46-08defa9530ab" />
<img width="238" height="514" alt="6" src="https://github.com/user-attachments/assets/90b73d9f-81fb-4c63-a5f0-50f78a8a0333" />
<img width="237" height="517" alt="7" src="https://github.com/user-attachments/assets/bdd59a87-332f-4733-964d-5b73d1501cef" />

| 发布招领 | FindAdd.ets | 表单：物品名称、时间、地点、电话、备注 |

<img width="239" height="512" alt="8" src="https://github.com/user-attachments/assets/e474529d-3761-4f12-9aa2-b3b0306829f7" />
<img width="236" height="512" alt="31" src="https://github.com/user-attachments/assets/85badab5-1241-4eac-abff-05ba250d36bf" />
<img width="233" height="512" alt="32" src="https://github.com/user-attachments/assets/5b1f5ba5-af89-418c-8e8f-0eaaa454d5d3" />


## 🚀 如何运行
### 环境要求
- DevEco Studio 3.1 及以上版本
- HarmonyOS SDK API 9+
- 鸿蒙手机 / 平板 / 模拟器

### 运行步骤
1. 使用 DevEco Studio 打开项目
2. 连接鸿蒙设备或启动模拟器
3. 执行 `Build` → `Clean Project`
4. 执行 `Build` → `Rebuild Project`
5. 点击运行按钮 ▶️ 或按 `Shift + F10`

## 📂 项目结构
entry/src/main/ets/
├── entryability/
│   └── EntryAbility.ts          # 应用入口
├── pages/
│   ├── Index.ets                # 首页
│   ├── LostList.ets             # 寻物列表
│   ├── FindList.ets             # 招领列表
│   ├── LostAdd.ets              # 发布寻物
│   └── FindAdd.ets              # 发布招领
└── resources/                   # 资源文件

## 🧩 路由配置
页面注册文件：`entry/src/main/resources/base/profile/main_pages.json`

```json
{
  "src": [
    "pages/Index",
    "pages/LostList",
    "pages/FindList",
    "pages/LostAdd",
    "pages/FindAdd"
  ]
}
```

📐 多端适配实现
通过监听窗口宽度变化，将设备分为三个断点：
· sm：宽度 < 600px（手机竖屏）→ 单列/两列网格
· md：600~840px（平板竖屏）→ 两列网格，侧边栏布局
· lg：≥ 840px（平板横屏/大屏）→ 三列网格，卡片式布局

平板页面展示


<img width="614" height="392" alt="20" src="https://github.com/user-attachments/assets/fee3c327-5dc1-4a7a-bfd5-03cc8d89588c" />
<img width="610" height="393" alt="21" src="https://github.com/user-attachments/assets/d3e74aaf-f55f-4184-bc46-7228ddd5dfda" />
<img width="611" height="395" alt="22" src="https://github.com/user-attachments/assets/47cb060e-41d6-476e-a311-234427baf0ae" />
<img width="613" height="395" alt="23" src="https://github.com/user-attachments/assets/ddba362c-0675-4b0c-9ec4-1af2346f5384" />
<img width="612" height="396" alt="24" src="https://github.com/user-attachments/assets/88b27cb2-09ed-4a51-8806-17e982016d6e" />
<img width="608" height="395" alt="25" src="https://github.com/user-attachments/assets/7db3e841-0cea-40e8-a557-cb2694e3a8fd" />
<img width="613" height="394" alt="26" src="https://github.com/user-attachments/assets/6e3d1590-d702-4bd2-bf23-b0877e64958e" />
<img width="613" height="389" alt="27" src="https://github.com/user-attachments/assets/e9c45e1f-a936-453a-831e-48a28ca36e39" />
<img width="611" height="395" alt="28" src="https://github.com/user-attachments/assets/33f3718c-cc88-4d0a-a0e3-3fb1fda06cc4" />
<img width="609" height="394" alt="33" src="https://github.com/user-attachments/assets/8fe3c33e-ca54-45b3-8b5c-5f7d9ce89cbc" />
<img width="610" height="392" alt="34" src="https://github.com/user-attachments/assets/e5fc42d6-d1e8-4210-ae76-42207a704c53" />


🎨 配色方案
元素 颜色值
主题色/寻物相关 #31a6ab
招领相关 #fec506
发布按钮 #ff6015
页面背景 #f7efe4

📝 数据示例
当前使用静态数据展示，后续可接入后端 API 或分布式数据库。

寻物启事示例
{
  itemName: '笔记本电脑',
  time: '2024-05-20 14:30',
  location: '图书馆3楼自习室',
  phone: '138****1234',
  reward: '200元',
  remark: '银色戴尔笔记本',
  imageIcon: '💻'
}

失物招领示例
{
  itemName: '充电宝',
  time: '2024-05-20 18:30',
  location: '教学楼A座201',
  phone: '138****3456',
  remark: '白色小米充电宝',
  imageIcon: '🔋'
}

⚠️ 待完善功能
· 图片/视频上传及显示（当前为 UI 占位符）
· 搜索功能与真实数据联动
· 数据持久化或云存储
· 用户登录与身份认证

🙋 作者
· GitHub: [jianglt6]

📅 版本记录

· 2026.06.05：完成多端适配和 UI 优化，提交作业版本
