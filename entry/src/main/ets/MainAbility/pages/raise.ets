import { commonSensorInfo } from '../components/commonSensorInfo'
import { MyProgress } from '../components/MyProgress'
import { operation } from '../components/operation'
import { MSG_CMD } from '../types/command'
import { closeSerial, openSerial, writeSerial } from '../utils/common'
import router from '@ohos.router'

interface BtnItem {
  cmd: MSG_CMD,
  name: string
}

const btnList: BtnItem[] = [
  { cmd: MSG_CMD.threeStageGantryLifting, name: "三级门架抬升" },
  { cmd: MSG_CMD.threeStageGantryStop, name: "三级门架停止" },
  { cmd: MSG_CMD.threeStageGantryLowering, name: "三级门架下降" },
  { cmd: MSG_CMD.Ob_inclinedBeamGripperExtension, name: "斜梁夹爪伸出" },
  { cmd: MSG_CMD.Ob_inclinedBeamGripperStop, name: "斜梁夹爪停止" },
  { cmd: MSG_CMD.Ob_inclinedBeamGripperRetraction, name: "斜梁夹爪缩回" },
  { cmd: MSG_CMD.Oc_inclinedBeamGripperClamping, name: "三级门架下降" },
  { cmd: MSG_CMD.Oc_inclinedBeamGripperStop, name: "三级门架下降" },
  { cmd: MSG_CMD.Oc_inclinedBeamGripperOpening, name: "三级门架下降" },
]
const oneCliBtn: BtnItem[] = [
  { cmd: MSG_CMD.OneClickToTurnItUp, name: "一键调高" },
  { cmd: MSG_CMD.OneClickStop, name: "一键停止" },
]

@Entry
@Component
struct Raise {
  controller: TextInputController = new TextInputController()
  @State targetHeight: string = ''
  @State ascSpeed: string = ''
  @State __padding: number = 5
  @State __fontSize_base: number = 15
  @State __btn_borderRadius: number = 10
  @State __currentHeight: number = 0
  @State __PullWireHeight: number = 0
  @State sPort: number = -1

  aboutToDisappear() {
    this.sPort = openSerial()
  }

  onPageHide() {
    closeSerial(this.sPort)
  }

  build() {
    Flex() {
      Column() {
        Text("三级门架抬升至操作高度").width("100%").textAlign(TextAlign.Center)
        Row() {
          Column() {
            MyProgress()
          }.width("40%").height("80%")

          Column() {
            Text("目标高度").width("100%").textAlign(TextAlign.Center)
            TextInput({ controller: this.controller, text: '420' })
              .height(40)
              .fontSize(14)
              .borderRadius(this.__btn_borderRadius)
              .fontColor(Color.Black)
              .width("50%")
              .onChange((value: string) => {
                this.targetHeight = value
              })
            Text(`当前高度`).width("100%").textAlign(TextAlign.Center)
            Text(`${this.__currentHeight}cm`).width("100%").textAlign(TextAlign.Center)
            Text("拉线高度").width("100%").textAlign(TextAlign.Center)
            Text(`${this.__PullWireHeight}cm`).width("100%").textAlign(TextAlign.Center)
          }.width("60%").justifyContent(FlexAlign.SpaceEvenly).height("100%")
        }.width("90%").height("100%")
      }.width('45%').height("100%").backgroundColor("#CCC")

      Column() {
        commonSensorInfo()
        Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Start, wrap: FlexWrap.Wrap }) {
          ForEach(oneCliBtn, (item: BtnItem) => {
            Button(item.name, { type: ButtonType.Normal, stateEffect: true })
              .width("30%")
              .fontSize(12)
              .margin(5)
              .padding(10)
              .borderRadius(5)
              .onClick(() => {
                console.log('send message:' + item.cmd + item.name)
                if (this.sPort === -1) {
                  this.sPort = openSerial()
                  writeSerial(this.sPort, item.cmd)
                } else {
                  writeSerial(this.sPort, item.cmd)
                }
              })
          })
        }.width("100%")

        Flex({ justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.Start, wrap: FlexWrap.Wrap }) {
          ForEach(btnList, (item: BtnItem) => {
            Button(item.name, { type: ButtonType.Normal, stateEffect: true })
              .width("30%")
              .fontSize(12)
              .margin(5)
              .padding(10)
              .borderRadius(5)
              .onClick(() => {
                console.log('send message:' + item.cmd + item.name)
                if (this.sPort === -1) {
                  this.sPort = openSerial()
                  writeSerial(this.sPort, item.cmd)
                } else {
                  writeSerial(this.sPort, item.cmd)
                }
              })
          })
        }.width("100%")

        Row({ space: 10 }) {
          Text("顶升速度")
          TextInput({ controller: this.controller })
            .height(40)
            .width("25%")
            .borderRadius(this.__btn_borderRadius)
            .fontColor(Color.Black)
            .onChange((value: string) => {
              this.ascSpeed = value
            })
          operation({ mode: "both", itemOnNextClick: () => {
            router.pushUrl({ url: "pages/formationTop" })
          }, itemOnPreviousClick: () => {
            router.pushUrl({ url: "pages/work" })
          } })
        }.width("90%")
        .justifyContent(FlexAlign.SpaceEvenly)
      }.width('55%').height("100%").backgroundColor("#f1f2f3").justifyContent(FlexAlign.SpaceEvenly)
    }.width("100%").height("100%")
  }
}

