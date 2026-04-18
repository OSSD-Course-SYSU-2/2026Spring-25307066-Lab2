import router from '@ohos.router';
import display from '@ohos.display';
import window from '@ohos.window';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct Index {
  @State showPublishDialog: boolean = false;
  @State searchText: string = '';
  @State curBp: string = 'md';

  aboutToAppear() {
    this.updateBreakpoint();
    try {
      let windowClass = window.getLastWindow(getContext(this));
      windowClass.then((win) => {
        win.on('windowSizeChange', () => {
          this.updateBreakpoint();
        });
      });
    } catch (err) {
      console.error('窗口监听失败: ' + JSON.stringify(err));
    }
  }

  updateBreakpoint() {
    let width = display.getDefaultDisplaySync().width;
    if (width < 600) {
      this.curBp = 'sm';
    } else if (width >= 600 && width < 840) {
      this.curBp = 'md';
    } else {
      this.curBp = 'lg';
    }
  }

  build() {
    Stack() {
      if (this.curBp === 'sm') {
        this.PhoneLayout();
      } else if (this.curBp === 'md') {
        this.PadLayout();
      } else {
        this.LargeLayout();
      }

      if (this.showPublishDialog) {
        this.PublishDialog();
      }
    }
  }

  @Builder
  PhoneLayout() {
    Column() {
      Row() {
        Text('🔍')
          .fontSize(16)
          .margin({ right: 6 })
        TextInput({ placeholder: "搜索", text: this.searchText })
          .width(120)
          .backgroundColor('transparent')
          .border({ width: 0 })
          .fontSize(14)
          .onChange((value: string) => {
            this.searchText = value;
          })
      }
      .backgroundColor(Color.White)
      .borderRadius(18)
      .padding({ left: 12, right: 12 })
      .margin({ top: 8, bottom: 12 })

      Row() {
        Column() {
          Text('🔍')
            .fontSize(28)
            .margin({ bottom: 6 })
          Text('寻物启事')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 4 })
          Text('查看丢失的物品信息')
            .fontSize(10)
            .fontColor('#666')
            .margin({ bottom: 12 })
          Button('→')
            .width('85%')
            .height(32)
            .backgroundColor('#31a6ab')
            .fontSize(20)
            .fontColor(Color.White)
            .borderRadius(16)
            .onClick(() => {
              router.pushUrl({ url: "pages/LostList" })
            })
        }
        .width('49%')
        .height(160)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor(Color.White)
        .borderRadius(12)
        .shadow({ radius: 6 })
        .margin({ right: '1%' })

        Column() {
          Text('📦')
            .fontSize(28)
            .margin({ bottom: 6 })
          Text('失物招领')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 4 })
          Text('查看捡到的物品信息')
            .fontSize(10)
            .fontColor('#666')
            .margin({ bottom: 12 })
          Button('→')
            .width('85%')
            .height(32)
            .backgroundColor('#fec506')
            .fontSize(20)
            .fontColor(Color.White)
            .borderRadius(16)
            .onClick(() => {
              router.pushUrl({ url: "pages/FindList" })
            })
        }
        .width('49%')
        .height(160)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor(Color.White)
        .borderRadius(12)
        .shadow({ radius: 6 })
        .margin({ left: '1%' })
      }
      .width('96%')

      Row() {
        Column() {
          Text('📝')
            .fontSize(28)
            .margin({ bottom: 6 })
          Text('发布信息')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 4 })
          Text('发布寻物或招领信息')
            .fontSize(10)
            .fontColor('#666')
            .margin({ bottom: 12 })
          Button('→')
            .width('85%')
            .height(32)
            .backgroundColor('#ff6015')
            .fontSize(20)
            .fontColor(Color.White)
            .borderRadius(16)
            .onClick(() => {
              this.showPublishDialog = true
            })
        }
        .width('49%')
        .height(160)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor(Color.White)
        .borderRadius(12)
        .shadow({ radius: 6 })
        .margin({ right: '1%' })

        Column() {
          Text('ℹ️')
            .fontSize(28)
            .margin({ bottom: 6 })
          Text('使用说明')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 4 })
          Text('了解系统使用方法')
            .fontSize(10)
            .fontColor('#666')
            .margin({ bottom: 12 })
          Button('→')
            .width('85%')
            .height(32)
            .backgroundColor('#999')
            .fontSize(20)
            .fontColor(Color.White)
            .borderRadius(16)
            .onClick(() => {
              promptAction.showToast({ message: '使用说明功能开发中', duration: 2000 })
            })
        }
        .width('49%')
        .height(160)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor(Color.White)
        .borderRadius(12)
        .shadow({ radius: 6 })
        .margin({ left: '1%' })
      }
      .width('96%')
      .margin({ top: 12 })

      Blank().height(16)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f7efe4')
  }

  @Builder
  PadLayout() {
    Row() {
      Column() {
        Text('失物招领系统')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor('#31a6ab')
          .margin({ top: 30, bottom: 40 })

        Text("寻物启事")
          .width('80%')
          .height(80)
          .fontSize(22)
          .backgroundColor('#31a6ab')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .borderRadius(12)
          .margin({ bottom: 20 })
          .onClick(() => {
            router.pushUrl({ url: "pages/LostList" })
          })

        Text("失物招领")
          .width('80%')
          .height(80)
          .fontSize(22)
          .backgroundColor('#fec506')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .borderRadius(12)
          .margin({ bottom: 30 })
          .onClick(() => {
            router.pushUrl({ url: "pages/FindList" })
          })

        Button("发布信息")
          .width('80%')
          .height(45)
          .backgroundColor('#ff6015')
          .fontSize(18)
          .fontColor(Color.White)
          .borderRadius(22)
          .onClick(() => {
            this.showPublishDialog = true
          })
      }
      .width('35%')
      .height('100%')
      .backgroundColor('#e8e0d5')
      .alignItems(HorizontalAlign.Center)

      Column() {
        Row() {
          Text('🔍')
            .fontSize(18)
            .margin({ right: 8 })
          TextInput({ placeholder: "搜索", text: this.searchText })
            .width(120)
            .backgroundColor('transparent')
            .border({ width: 0 })
            .onChange((value: string) => {
              this.searchText = value;
            })
        }
        .backgroundColor(Color.White)
        .borderRadius(22)
        .padding({ left: 15, right: 15 })
        .margin({ top: 40 })

        Column() {
          Text('欢迎使用')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor('#31a6ab')
            .margin({ bottom: 10 })
          Text('校园失物招领系统')
            .fontSize(18)
            .fontColor('#666')
          Text('帮助同学们快速找回丢失物品')
            .fontSize(14)
            .fontColor('#999')
            .margin({ top: 10 })
        }
        .width('80%')
        .height(200)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor('#f0e8dc')
        .borderRadius(16)
        .margin({ top: 30 })
      }
      .width('65%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f7efe4')
  }

  @Builder
  LargeLayout() {
    Column() {
      Row() {
        Text('校园失物招领系统')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor('#31a6ab')
        Blank()
        Row() {
          Text('🔍')
            .fontSize(18)
            .margin({ right: 8 })
          TextInput({ placeholder: "搜索", text: this.searchText })
            .width(120)
            .height(40)
            .backgroundColor(Color.White)
            .borderRadius(20)
            .padding({ left: 15 })
            .onChange((value: string) => {
              this.searchText = value;
            })
        }
      }
      .width('90%')
      .margin({ top: 20 })

      Row() {
        Column() {
          Text('🔍')
            .fontSize(48)
            .margin({ bottom: 15 })
          Text('寻物启事')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
          Text('查看丢失的物品信息')
            .fontSize(14)
            .fontColor('#666')
            .margin({ bottom: 20 })
          Button('→')
            .width('60%')
            .height(40)
            .backgroundColor('#31a6ab')
            .fontSize(24)
            .fontColor(Color.White)
            .onClick(() => {
              router.pushUrl({ url: "pages/LostList" })
            })
        }
        .width('28%')
        .height(250)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor(Color.White)
        .borderRadius(20)
        .shadow({ radius: 10 })
        .margin(10)

        Column() {
          Text('📦')
            .fontSize(48)
            .margin({ bottom: 15 })
          Text('失物招领')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
          Text('查看捡到的物品信息')
            .fontSize(14)
            .fontColor('#666')
            .margin({ bottom: 20 })
          Button('→')
            .width('60%')
            .height(40)
            .backgroundColor('#fec506')
            .fontSize(24)
            .fontColor(Color.White)
            .onClick(() => {
              router.pushUrl({ url: "pages/FindList" })
            })
        }
        .width('28%')
        .height(250)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor(Color.White)
        .borderRadius(20)
        .shadow({ radius: 10 })
        .margin(10)

        Column() {
          Text('📝')
            .fontSize(48)
            .margin({ bottom: 15 })
          Text('发布信息')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
          Text('发布寻物或招领信息')
            .fontSize(14)
            .fontColor('#666')
            .margin({ bottom: 20 })
          Button('→')
            .width('60%')
            .height(40)
            .backgroundColor('#ff6015')
            .fontSize(24)
            .fontColor(Color.White)
            .onClick(() => {
              this.showPublishDialog = true
            })
        }
        .width('28%')
        .height(250)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor(Color.White)
        .borderRadius(20)
        .shadow({ radius: 10 })
        .margin(10)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 50 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f7efe4')
  }

  @Builder
  PublishDialog() {
    Column() {
      Column() {
        Row() {
          Text('发布信息')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
          Blank()
          Text('✕')
            .fontSize(20)
            .onClick(() => {
              this.showPublishDialog = false
            })
        }
        .width('90%')
        .margin({ top: 15 })

        Divider()
          .margin({ top: 10, bottom: 15 })

        Button('寻物启事')
          .width('80%')
          .height(45)
          .backgroundColor('#31a6ab')
          .fontSize(16)
          .fontColor(Color.White)
          .borderRadius(22)
          .onClick(() => {
            this.showPublishDialog = false
            router.pushUrl({ url: "pages/LostAdd" })
          })

        Button('失物招领')
          .width('80%')
          .height(45)
          .backgroundColor('#fec506')
          .fontSize(16)
          .fontColor(Color.White)
          .borderRadius(22)
          .margin({ top: 15 })
          .onClick(() => {
            this.showPublishDialog = false
            router.pushUrl({ url: "pages/FindAdd" })
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