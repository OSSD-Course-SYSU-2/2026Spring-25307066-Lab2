import router from '@ohos.router';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct FindAdd {
  @State itemName: string = ''
  @State time: string = ''
  @State location: string = ''
  @State phone: string = ''
  @State remark: string = ''
  @State showMediaDialog: boolean = false
  @State showSuccessDialog: boolean = false

  build() {
    Stack() {
      Column() {
        Row() {
          Blank()
          Text('✕')
            .fontSize(22)
            .fontColor('#666')
            .onClick(() => {
              router.back()
            })
        }
        .width('95%')
        .margin({ top: 15 })
        .padding({ right: 10 })

        Text('发布失物招领')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 20 })
          .fontColor('#fec506')

        Scroll() {
          Column() {
            Column() {
              Text('📷 图片/视频')
                .fontSize(16)
                .fontColor('#999')
              Text('点击上传')
                .fontSize(12)
                .fontColor('#007DFF')
                .margin({ top: 8 })
            }
            .width('90%')
            .height(150)
            .border({
              width: 2,
              style: BorderStyle.Dashed,
              color: '#fec506'
            })
            .borderRadius(10)
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .margin({ bottom: 20 })
            .backgroundColor(Color.White)
            .onClick(() => {
              this.showMediaDialog = true
            })

            Row() {
              Text('失物招领')
                .width('100%')
                .height(45)
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
                .backgroundColor('#fec506')
                .textAlign(TextAlign.Center)
            }
            .width('95%')

            this.createFormRow('物品名称', this.itemName, (value: string) => { this.itemName = value })
            this.createFormRow('时间', this.time, (value: string) => { this.time = value })
            this.createFormRow('地点', this.location, (value: string) => { this.location = value })
            this.createFormRow('联系电话', this.phone, (value: string) => { this.phone = value })
            this.createFormRow('备注', this.remark, (value: string) => { this.remark = value })

            Button('发布信息')
              .width('90%')
              .height(45)
              .backgroundColor('#ff6015')
              .fontSize(18)
              .fontColor(Color.White)
              .margin({ top: 30, bottom: 30 })
              .onClick(() => {
                this.showSuccessDialog = true
              })
          }
          .width('100%')
        }
        .scrollBar(BarState.Auto)
        .width('100%')
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#f7efe4')

      if (this.showMediaDialog) {
        Column() {
          Column() {
            Row() {
              Text('选择媒体')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
              Blank()
              Text('✕')
                .fontSize(20)
                .onClick(() => {
                  this.showMediaDialog = false
                })
            }
            .width('90%')
            .margin({ top: 15 })

            Divider()
              .margin({ top: 10, bottom: 15 })

            Button('选取照片')
              .width('80%')
              .height(45)
              .backgroundColor('#fec506')
              .fontSize(16)
              .fontColor(Color.White)
              .onClick(() => {
                this.showMediaDialog = false
                promptAction.showToast({ message: '选取照片功能开发中', duration: 2000 })
              })

            Button('选取视频')
              .width('80%')
              .height(45)
              .backgroundColor('#fec506')
              .fontSize(16)
              .fontColor(Color.White)
              .margin({ top: 15 })
              .onClick(() => {
                this.showMediaDialog = false
                promptAction.showToast({ message: '选取视频功能开发中', duration: 2000 })
              })
          }
          .width('70%')
          .backgroundColor(Color.White)
          .borderRadius(15)
          .padding({ bottom: 20 })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.5)')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }

      if (this.showSuccessDialog) {
        Column() {
          Column() {
            Row() {
              Text('提示')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
              Blank()
              Text('✕')
                .fontSize(20)
                .onClick(() => {
                  this.showSuccessDialog = false
                })
            }
            .width('90%')
            .margin({ top: 15 })

            Divider()
              .margin({ top: 10, bottom: 15 })

            Text('✓ 发布成功！')
              .fontSize(18)
              .fontColor('#4CAF50')
              .margin({ top: 10, bottom: 10 })

            Button('确定')
              .width('80%')
              .height(40)
              .backgroundColor('#ff6015')
              .fontSize(16)
              .fontColor(Color.White)
              .margin({ top: 15, bottom: 10 })
              .onClick(() => {
                this.showSuccessDialog = false
                router.back()
              })
          }
          .width('70%')
          .backgroundColor(Color.White)
          .borderRadius(15)
          .padding({ bottom: 20 })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.5)')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
    }
  }

  @Builder
  createFormRow(label: string, value: string, onChange: (value: string) => void) {
    Column() {
      Row() {
        Text(label)
          .width('30%')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .textAlign(TextAlign.Center)
          .padding(10)
          .backgroundColor(Color.White)
        TextInput({ text: value, placeholder: `请输入${label}` })
          .width('70%')
          .height(40)
          .fontSize(14)
          .padding({ left: 10 })
          .backgroundColor(Color.White)
          .onChange((value: string) => {
            onChange(value)
          })
      }
      .width('95%')
      .height(50)
    }
    .width('100%')
    .borderWidth({ bottom: 1 })
    .borderColor('#eee')
  }
}