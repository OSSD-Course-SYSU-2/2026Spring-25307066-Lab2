import router from '@ohos.router';

@Entry
@Component
struct LostList {
  @State lostItems: LostItem[] = [
    {
      itemName: '笔记本电脑',
      time: '2024-05-20 14:30',
      location: '图书馆3楼自习室',
      phone: '138****1234',
      reward: '200元',
      remark: '银色戴尔笔记本，有贴纸',
      imageIcon: '💻'
    },
    {
      itemName: '校园卡',
      time: '2024-05-21 09:00',
      location: '第一食堂',
      phone: '139****5678',
      reward: '感谢',
      remark: '姓名：张三，学号：2024001',
      imageIcon: '🪪'
    },
    {
      itemName: '书包',
      time: '2024-05-21 16:20',
      location: '操场看台',
      phone: '137****9012',
      reward: '50元',
      remark: '黑色双肩包，内有课本',
      imageIcon: '🎒'
    },
    {
      itemName: '蓝牙耳机',
      time: '2024-05-22 11:45',
      location: '第二教学楼201教室',
      phone: '136****3456',
      reward: '100元',
      remark: '白色AirPods Pro，有轻微划痕',
      imageIcon: '🎧'
    },
    {
      itemName: '钥匙串',
      time: '2024-05-22 18:30',
      location: '学生宿舍楼下',
      phone: '135****7890',
      reward: '感谢',
      remark: '蓝色钥匙扣，有三把钥匙和一个门禁卡',
      imageIcon: '🔑'
    }
  ];

  build() {
    Column() {
      Row() {
        Blank()
        Text('✕')
          .fontSize(22)
          .fontColor('#666')
          .onClick(() => {
            router.back();
          })
      }
      .width('95%')
      .margin({ top: 15 })
      .padding({ right: 10 })

      Text('寻物启事列表')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 20 })
        .fontColor('#31a6ab')

      Scroll() {
        Column() {
          ForEach(this.lostItems, (item: LostItem, index: number) => {
            this.createItemCard(item, index)
            if (index < this.lostItems.length - 1) {
              Blank().height(20)
            }
          })
        }
        .width('100%')
        .padding({ left: 10, right: 10, bottom: 20 })
      }
      .scrollBar(BarState.Auto)
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f7efe4')
  }

  @Builder
  createItemCard(item: LostItem, index: number) {
    Row() {
      Column() {
        Text(item.imageIcon)
          .fontSize(48)
        Text('图片/视频')
          .fontSize(12)
          .fontColor('#999')
          .margin({ top: 5 })
      }
      .width(120)
      .height(120)
      .border({
        width: 2,
        style: BorderStyle.Dashed,
        color: '#31a6ab'
      })
      .borderRadius(8)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ right: 12 })
      .backgroundColor(Color.White)

      Column() {
        this.createInfoRow('物品名称', item.itemName)
        this.createInfoRow('丢失时间', item.time)
        this.createInfoRow('丢失地点', item.location)
        this.createInfoRow('联系电话', item.phone)
        this.createInfoRow('酬金', item.reward)
        this.createInfoRow('备注', item.remark)
      }
      .layoutWeight(1)
    }
    .width('100%')
    .padding(12)
    .border({
      width: 2,
      color: '#31a6ab',
      style: BorderStyle.Solid
    })
    .borderRadius(12)
    .backgroundColor(Color.White)
  }

  @Builder
  createInfoRow(label: string, value: string) {
    Row() {
      Text(label)
        .width(70)
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor('#666')
      Text(value)
        .layoutWeight(1)
        .fontSize(14)
        .fontColor('#333')
    }
    .width('100%')
    .height(38)
    .borderWidth({ bottom: 1 })
    .borderColor('#f0f0f0')
  }
}

interface LostItem {
  itemName: string;
  time: string;
  location: string;
  phone: string;
  reward: string;
  remark: string;
  imageIcon: string;
}