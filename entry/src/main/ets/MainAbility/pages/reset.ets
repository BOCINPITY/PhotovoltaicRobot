import { commonSensorInfo } from '../components/commonSensorInfo'
import { operation } from '../components/operation'
import router from '@ohos.router'

@Entry
@Component
struct Reset {
  @State message: string = 'Hello World'
  @State operationMode: string[] = ['', '', '', '', '']
  @State layOutMode: boolean = false
  @State h: number = 0
  @State __rotate: number = 0

  build() {
    Flex() {
      Column() {
        Flex({ justifyContent: FlexAlign.SpaceAround, alignContent: FlexAlign.Center, wrap: FlexWrap.Wrap }) {
          ForEach(this.operationMode, (item: string) => {
            Text(item)
              .width(50)
              .height(50)
              .fontSize(12)
              .border({ width: 10, radius: 25, style: BorderStyle.Solid, color: "#ffffb700" })
              .backgroundColor('red')
          })
        }.width("100%").height("25%").backgroundColor("#CCC")

        Stack({ alignContent: Alignment.BottomStart }) {

        }.width("100%").height("75%").backgroundColor("#000")
      }.width("70%").height("100%").backgroundColor("#CCC")

      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
        commonSensorInfo()
        Button("一键复位", { type: ButtonType.Normal }).borderRadius(10)
        Text(`门架升顶高度${this.h}cm`)
        Text(`斜梁倾斜角度${this.__rotate}°`)
        operation({ mode: "last", itemOnPreviousClick: () => {
          router.pushUrl({ url: "pages/formationRotation" })
        }, itemOnBackHomeClick: () => {
          router.pushUrl({ url: "pages/index" })
        } })
      }.width("30%").height("100%").backgroundColor("#FEE")
    }.width("100%").height("100%")
  }
}

