import { GlobalVariable } from '../commons/constants/GlobalVariable'
import { HomeView } from '../views/home/HomeView'
import { MineView } from '../views/mine/MineView'
import { ResourceView } from '../views/resource/ResourceView'

interface TabBarItem {
  icon: Resource
  name: string
}

@Entry
@Component
struct Index {
  @StorageProp(GlobalVariable.TOP_HEIGHT) topHeight: number = 0
  @StorageProp(GlobalVariable.BOTTOM_HEIGHT) bottomHeight: number = 0
  @State activeIndex: number = 0

  tarBarList: TabBarItem[] = [
    {
      icon: $r('app.media.ic_tabbar_home'),
      name: '首页'
    },
    {
      icon: $r('app.media.ic_tabbar_resource'),
      name: '资源'
    },
    {
      icon: $r('app.media.ic_tabbar_mine'),
      name: '我的'
    }
  ]

  @Builder tabBarBuilder(item: TabBarItem, index: number) {
    Column({space: 5}) {
      Image(item.icon)
        .width(24)
        .aspectRatio(1)
        .fillColor(this.activeIndex == index ? Color.Green : Color.Gray)
      Text(item.name)
        .fontSize(12)
        .fontColor(this.activeIndex == index ? Color.Green : Color.Gray)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Tabs({index: this.activeIndex, barPosition: BarPosition.End}) {
      ForEach(this.tarBarList, (item: TabBarItem, index) => {
        TabContent() {
          if (index == 0) {
            HomeView()
          } else if (index == 1) {
            ResourceView()
          } else {
            MineView()
          }
        }
          .tabBar(this.tabBarBuilder(item, index))
      })
    }
    .onTabBarClick((index) => {
      this.activeIndex = index
    })
    .height('100%')
    .width('100%')
    .padding({ top: this.topHeight, bottom: this.bottomHeight })
  }
}