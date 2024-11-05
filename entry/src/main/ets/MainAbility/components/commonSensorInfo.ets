import { getSeconds, getTime } from '../utils/time'
@Component
export struct commonSensorInfo {
  @State __batteryLevel: string = ''
  @State __currentTime: string = getTime() + getSeconds()
  @State __temperature: string = ''
  @State __humidity: string = ''
  aboutToAppear(){
    setInterval(() => {
      let date = new Date
      this.__currentTime = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':' + (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ':' + (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds())
    },1000)
  }

  build() {
    Column({space:5}) {
      Row({}) {
        Text(this.__currentTime).fontSize(12)
        Text("电量:50%").fontSize(12)
      }.width("100%").height("50%").justifyContent(FlexAlign.SpaceAround)
      Row() {
        Text("温度:").fontSize(12)
        Text("湿度：").fontSize(12)
      }.width("100%").height("50%").justifyContent(FlexAlign.SpaceAround)
    }.width(120).height(60).justifyContent(FlexAlign.SpaceBetween)
  }
}
