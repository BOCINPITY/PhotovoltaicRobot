import { commonSensorInfo } from '../components/commonSensorInfo'
import { operation } from '../components/operation'
import { panel } from '../components/panel'
import router from '@ohos.router'

@Entry
@Component
struct FormationRotation {
  @State message: string = 'Hello World'
  @State __padding:number = 5
  @State target:string = ''
  @State speed:string = ''
  @State diffSpeed:string = ''
  build() {
    Row() {
      panel({panelType:0, title: "机器人1" ,btn1:"倾斜",btn2:"停止",btn3:"下降"})
      panel({panelType:0,title: "机器人2" ,btn1:"倾斜",btn2:"停止",btn3:"下降"})
      panel({panelType:0, title: "机器人3" ,btn1:"倾斜",btn2:"停止",btn3:"下降"})
      panel({panelType:0, title: "机器人4" ,btn1:"倾斜",btn2:"停止",btn3:"下降"})
      Column({space:10}) {
        commonSensorInfo()
        Row() {
          Text("目标高度").padding(this.__padding)
          TextInput().onChange((value:string)=>{
            this.target = value
          }).width(60).height(24).fontSize(12).type(InputType.Number)
        }.width("100%").justifyContent(FlexAlign.Center)
        Row() {
          Text("倾斜速度").padding(this.__padding)
          TextInput().onChange((value:string)=>{
            this.speed = value
          }).width(60).height(24).fontSize(12).type(InputType.Number)
        }.width("100%").justifyContent(FlexAlign.Center)
        Row() {
          Text("速度插值").padding(this.__padding)
          TextInput().onChange((value:string)=>{
            this.diffSpeed = value
          }).width(60).height(24).fontSize(12).type(InputType.Number)
        }.width("100%").justifyContent(FlexAlign.Center)
        Button('一键倾斜',{type:ButtonType.Normal}).fontSize(12).borderRadius(5).padding(5)
        Button('停止倾斜',{type:ButtonType.Normal}).fontSize(12).borderRadius(5).padding(5)
        operation({mode:"both",itemOnPreviousClick:() => {router.pushUrl({url:"pages/formationTop"})},itemOnNextClick:() => {router.pushUrl({url:"pages/reset"})}})
      }.height('100%').width(200)
    }
    .height('100%').width('100%')
  }
}

