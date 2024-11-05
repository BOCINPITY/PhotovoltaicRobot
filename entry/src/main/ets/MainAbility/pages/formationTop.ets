import { commonSensorInfo } from '../components/commonSensorInfo'
import { operation } from '../components/operation'
import { panel } from '../components/panel'
import router from '@ohos.router'

@Entry
@Component
struct FormationTop {
  @State __padding:number = 5
  @State target:string = ''
  @State speed:string = ''
  @State diffSpeed:string = ''
  build() {
    Row() {
      panel({ panelType:1,title: "机器人1" ,btn1:"上升",btn2:"停止",btn3:"下降"})
      panel({ panelType:1,title: "机器人2" ,btn1:"上升",btn2:"停止",btn3:"下降"})
      panel({ panelType:1,title: "机器人3" ,btn1:"上升",btn2:"停止",btn3:"下降"})
      panel({ panelType:1,title: "机器人4" ,btn1:"上升",btn2:"停止",btn3:"下降"})

      Column({space:10}) {
        commonSensorInfo()
        Row() {
          Text("联机模式")
          Toggle({ type: ToggleType.Switch, isOn: false })
            .selectedColor('#007DFF')
            .switchPointColor('#FFFFFF')
            .height(20)
            .onChange((isOn: boolean) => {
              console.info('Component status:' + isOn)
            })
        }.width("100%").justifyContent(FlexAlign.Center)
        Row() {
          Text("目标高度").padding(this.__padding)
          TextInput().onChange((value:string)=>{
            this.target = value
          }).width(60).height(24).fontSize(12).type(InputType.Number)
        }.width("100%").justifyContent(FlexAlign.Center)
        Row() {
          Text("升顶速度").padding(this.__padding)
          TextInput().onChange((value:string)=>{
            this.speed = value
          }).width(60).height(24).fontSize(12).type(InputType.Number)
        }.width("100%").justifyContent(FlexAlign.Center)
        Row() {
          Text("速度填差").padding(this.__padding)
          TextInput().onChange((value:string)=>{
            this.diffSpeed = value
          }).width(60).height(24).fontSize(12).type(InputType.Number)
        }.width("100%").justifyContent(FlexAlign.Center)
        Button('一键升顶',{type:ButtonType.Normal}).fontSize(12).borderRadius(5).padding(5)
        Button('停止升顶',{type:ButtonType.Normal}).fontSize(12).borderRadius(5).padding(5)
        operation({mode:"both",itemOnPreviousClick:() => {router.pushUrl({url:"pages/raise"})},itemOnNextClick:() => {router.pushUrl({url:"pages/formationRotation"})}})
      }.height('100%').width(200)
    }
    .height('100%').width('100%')
  }
}

