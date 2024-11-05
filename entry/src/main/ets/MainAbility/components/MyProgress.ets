import { generateRange } from '../utils/common'
@Component
export struct MyProgress {
  @State targetHeight:number = 500 //目标高度
  @State currentHeight:number = 100 //当前高度，当前高度会一直变化
  @State baseHeight:number = 100 //基础高度
  @State speed:number = 10 //速度
  @State diffTargetCurrent:number = this.targetHeight-this.baseHeight
  @State __borderRadius: number = 5
  @State __width: number = 20
  @State __step: number = 100
  @State __range: Array<number> = generateRange(this.baseHeight,this.targetHeight)
  @State timer: number = -1

  aboutToAppear() {
    this.timer = setInterval(() => {
      this.currentHeight += this.speed
      if (this.currentHeight >= this.targetHeight) {
        clearInterval(this.timer)
      }
    }, 1000)
  }
  build() {
    Column() {
      Row({ space: 10 }) {
        Column() {
          ForEach(this.__range, (item: number) => {
            Text(item.toString()) {
            }.fontSize(8).width(25).textAlign(TextAlign.End)
          }, (item: string) => item)
        }.height("100%").justifyContent(FlexAlign.SpaceBetween)

        Column() {
          Row() {
            Column() {
              ForEach(this.__range, (item: number) => {
                Text('-')
              }, (item: string) => item)
            }.height("100%").justifyContent(FlexAlign.SpaceBetween).alignItems(HorizontalAlign.Start).margin({top:3})
            Column() {
              Column() {
              }.height(`${(((this.currentHeight-this.baseHeight)/this.diffTargetCurrent)*100).toString()}%`).backgroundColor("#ffe300").width("100%").animation({
                duration: 1000,
              })
            }
            .height("100%")
            .width("100%")
            .justifyContent(FlexAlign.End)
            .borderWidth(1)
            .borderColor('#000')
            Column() {
              Text(`${(((this.currentHeight-this.baseHeight)/this.diffTargetCurrent)*this.diffTargetCurrent + this.baseHeight).toString()}`)
              Column() {
              }.height(`${(((this.currentHeight-this.baseHeight)/this.diffTargetCurrent)*100).toString()}%`).animation({
                duration: 1000,
              })
            }
            .height("100%")
            .justifyContent(FlexAlign.End)
          }.height("100%").width("100%")

        }.height("100%").width(50).borderRadius(this.__borderRadius)
      }
    }
    .height('100%')
    .width(20)
    .justifyContent(FlexAlign.End)
    .borderRadius(this.__borderRadius)
    .width(this.__width)
  }
}