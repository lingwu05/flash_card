import { router } from '@kit.ArkUI';
import { GlobalVariable } from '../commons/constants/Index';

@Entry
@Component
struct WelcomePage {
  @StorageProp(GlobalVariable.TOP_HEIGHT) topHeight: number = 0
  @StorageProp(GlobalVariable.BOTTOM_HEIGHT) bottomHeight: number = 0
  @State countDownSeconds: number = 3
  timeId: number = 0

  onPageShow(): void {

    this.timeId = setInterval(() => {
      if (this.countDownSeconds == 0) {
        router.pushUrl({
          url: '/pages/Index'.slice(1)
        })

      } else {
        this.countDownSeconds--;
      }
    }, 1000);
  }

  onPageHide(): void {
    clearInterval(this.timeId)
    router.clear()
  }

  build() {
    Column() {
      Row() {
        Blank()
        Text(this.countDownSeconds + 's')
          .backgroundColor('#fae4d9')
          .width(40)
          .height(30)
          .borderRadius(13)
          .textAlign(TextAlign.Center)
          .fontSize(16)
          .opacity(0.5)
      }
      .padding({right: 5, top: 5})
      .width('100%')
      Blank()
      Image($r('app.media.foreground'))
        .width(300)
      Text('温故知新')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Divider()
        .strokeWidth(3)
        .width(80)
        .margin({top: 10, bottom: 10})
      Text('忆求不忘')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin({bottom: 40})
      Text('暗记相伴，知识星芒点亮，记忆深植，开启高效学习的智慧新航')
        .maxLines(2)
        .width('78%')
        .fontSize(18)
        .lineHeight(25)
        .margin({bottom: 120})

    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Pink)
    .linearGradient({
      colors: [[Color.White, 0], ['#ff2f9cdd', 1]],
      direction: GradientDirection.Top
    })
    .padding({ top: this.topHeight, bottom: this.bottomHeight })
  }
}