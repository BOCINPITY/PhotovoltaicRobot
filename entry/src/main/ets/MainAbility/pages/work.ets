import { commonSensorInfo } from '../components/commonSensorInfo'
import { operation } from '../components/operation'
import bundle from '@ohos.bundle'
import featureAbility from '@ohos.ability.featureAbility';
import { closeSerial, openSerial, writeSerial } from '../utils/common';
import { MSG_CMD } from "../types/command"
import router from '@ohos.router';

let context = featureAbility.getContext();


interface BtnItem {
  cmd: MSG_CMD,
  name: string
}

const operationMode: BtnItem[] = [{
  cmd: MSG_CMD.OpenTheGripper,
  name: '打开抓夹'
},
  {
    cmd: MSG_CMD.TheGripperStops,
    name: '抓夹停止'
  }, {
    cmd: MSG_CMD.CloseTheGripper,
    name: '关闭抓夹'
  }, {
    cmd: MSG_CMD.LiftTheGripper,
    name: '抬升抓夹'
  }, {
    cmd: MSG_CMD.StopLifting,
    name: '停止升降'
  }, {
    cmd: MSG_CMD.DropTheGripper,
    name: '下降抓夹'
  }]
const sideOperations: BtnItem[] = [
  { cmd: MSG_CMD.cartJacking, name: '上升' },
  { cmd: MSG_CMD.cartStop, name: '停止' },
  { cmd: MSG_CMD.cartDecline, name: '下降' },
]

@Entry
@Component
struct Work {
  @State message: string = 'Hello World'
  @State layOutMode: boolean = false
  @State sPort: number = -1
  @State cmd: string = ''

  aboutToAppear() {
    context.setDisplayOrientation(bundle.DisplayOrientation.LANDSCAPE)
    this.sPort = openSerial()
    console.log(`debug sPort is opened?${this.sPort.toString()}`)
  }

  onPageHide() {
    closeSerial(this.sPort)
  }

  sendMessageToSerial(msg: MSG_CMD) {
    if (this.sPort === -1) {
      this.sPort = openSerial()
      writeSerial(this.sPort, msg)
    } else {
      writeSerial(this.sPort, msg)
    }
  }

  build() {
    Flex() {
      Column() {
        Flex({ justifyContent: FlexAlign.SpaceAround, alignContent: FlexAlign.Center, wrap: FlexWrap.Wrap }) {
          ForEach(operationMode, (item: BtnItem) => {
            Button(item.name, { type: ButtonType.Normal, stateEffect: true })
              .fontSize(12)
              .margin(5)
              .padding(10)
              .borderRadius(5)
              .onClick(() => {
                console.log(`comand line is ${item.cmd}`)
                this.sendMessageToSerial(item.cmd)
              })
          })
        }.width("100%").height("25%").backgroundColor("#CCC")

        Stack({ alignContent: Alignment.BottomStart }) {
          operation({ mode: 'onlyPre', itemOnPreviousClick: () => {
            router.pushUrl({ url: "pages/index" })
          } })
        }.width("100%").height("75%").backgroundColor("#000")
      }.width("70%").height("100%").backgroundColor("#CCC")

      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
        commonSensorInfo()
        Text('柱桩顶部距离')
        Text('12.3cm')
          .width("60%")
          .height(30)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderColor("black")
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .fontSize(14)
        Column({ space: 5 }) {
          Text("前后调平")
          ForEach(sideOperations, (item: BtnItem) => {
            Button(item.name, { type: ButtonType.Normal, stateEffect: true })
              .fontSize(12)
              .width('50%')
              .fontSize(12)
              .margin(5)
              .padding(5)
              .borderRadius(5)
              .onClick(() => {
                this.sendMessageToSerial(item.cmd)
              })
          })
        }
        .padding(5)
        .width("80%")
        .borderStyle(BorderStyle.Solid)
        .borderWidth(1)
        .borderColor("black")
        .borderRadius(10)

        Row() {
          Text()
            .width(30)
            .height(30)
            .backgroundColor("red")
            .borderRadius(15)
            .borderStyle(BorderStyle.Solid)
            .borderWidth(5)
            .borderColor("#ffa59c9c")

          Text()
            .width(30)
            .height(30)
            .backgroundColor("red")
            .borderRadius(15)
            .borderStyle(BorderStyle.Solid)
            .borderWidth(5)
            .borderColor("#ffa59c9c")

          Text()
            .width(30)
            .height(30)
            .backgroundColor("red")
            .borderRadius(15)
            .borderStyle(BorderStyle.Solid)
            .borderWidth(5)
            .borderColor("#ffa59c9c")

        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width("80%")

        Button('一键抱桩', { type: ButtonType.Normal, stateEffect: true })
          .width('80%')
          .padding(10)
          .fontSize(14)
          .borderRadius(5)
          .onClick(() => {
            this.sendMessageToSerial(MSG_CMD.OneClickPileHolding)
            setTimeout(() => {
              router.pushUrl({ url: "pages/raise" })
            }, 2 * 1000)
          })

      }.width("30%").height("100%").backgroundColor("#FEE")
    }.width("100%").height("100%")
  }
}

