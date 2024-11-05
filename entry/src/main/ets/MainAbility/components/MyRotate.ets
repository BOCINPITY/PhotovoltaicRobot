@Component
export struct MyRotate {
  build() {
    Column() {
      Stack({ alignContent: Alignment.Center }) {
        Circle()
          .width(100)
          .height('80%')
          .fillOpacity(0)
          .strokeWidth(3)
          .stroke(Color.Black)
          .strokeDashArray([1, 2])
          .align(Alignment.Start)
        Polyline({ width: 120, height: 120 })
          .points([[60, 60], [20, 40]]) //三角计算
          .fillOpacity(0)
          .stroke($r("app.color.color_primary"))
          .strokeWidth(2)
        Circle()
          .width(5)
          .height(5)
          .align(Alignment.Start)

      }.width(120).height(120)

      Text("<angle>").fontSize(12)
    }.width('100%').height("100%").justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)
  }
}