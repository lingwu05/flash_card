import { window } from '@kit.ArkUI';
import { GlobalVariable, logger } from '../constants/Index';

class FullScreen {
  async enable() {
    try {
      const context = AppStorage.get<Context>(GlobalVariable.CONTEXT)
      if (context) {
        const win = await window.getLastWindow(context)
        await win.setWindowLayoutFullScreen(true)
        const topArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
        AppStorage.setOrCreate(GlobalVariable.TOP_HEIGHT, px2vp(topArea.topRect.height))
        const bottomArea =  win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
        AppStorage.setOrCreate(GlobalVariable.BOTTOM_HEIGHT, px2vp(bottomArea.bottomRect.height))
      }
    } catch (e) {
      logger.error('FullScreen enable', JSON.stringify(e))
    }
  }

  async disable() {
    try {
      const context = AppStorage.get<Context>(GlobalVariable.CONTEXT)
      if (context) {
        const win = await window.getLastWindow(context)
        await win.setWindowLayoutFullScreen(false)
        AppStorage.setOrCreate(GlobalVariable.TOP_HEIGHT, 0)
        AppStorage.setOrCreate(GlobalVariable.BOTTOM_HEIGHT, 0)
      }
    } catch (e) {
      logger.error('FullScreen disable', JSON.stringify(e))
    }
  }
}

export const fullScreen = new FullScreen()