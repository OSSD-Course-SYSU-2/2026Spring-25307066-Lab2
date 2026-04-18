import router from '@ohos.router';

@Entry
@Component
struct FindList {
  @State findItems: FindItem[] = [
    {
      itemName: '充电宝',
      time: '2024-05-20 18:30',
      location: '教学楼A座201',
      phone: '138****3456',
      remark: '白色小米充电宝',
      imageIcon: '🔋'
    },
    {
      itemName: '雨伞',
      time: '2024-05-21 12:00',
      location: '图书馆门口',
      phone: '139****7890',
      remark: '蓝色折叠伞',
      imageIcon: '🌂'
    },
    {
      itemName: '钥匙串',
      time: '2024-05-21 15:45',
      location: '体育馆更衣室',
      phone: '137****2345',
      remark: '含U盘和门禁卡',
      imageIcon: '🔑'
    },
    {
      itemName: '眼镜',
      time: '2024-05-22 08:30',
      location: '第二食堂',
      phone: '136****6789',
      remark: '黑色方框眼镜',
      imageIcon: '👓'
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

      Text('失物招领列表')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 20 })
        .fontColor('#fec506')

      Scroll() {
        Column() {
          ForEach(this.findItems, (item: FindItem, index: number) => {
            this.createItemCard(item, index)
            if (index < this.findItems.length - 1) {
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
  createItemCard(item: FindItem, index: number) {
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
        color: '#fec506'
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
        this.createInfoRow('备注', item.remark)
      }
      .layoutWeight(1)
    }
    .width('100%')
    .padding(12)
    .border({
      width: 2,
      color: '#fec506',
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

interface FindItem {
  itemName: string;
  time: string;
  location: string;
  phone: string;
  remark: string;
  imageIcon: string;
}
