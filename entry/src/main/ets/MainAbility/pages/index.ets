import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State __border: number = 20
  @State __padding: number = 10
  @State __visible: boolean = true
  @State routeInfo: any = router.getParams()

  async aboutToAppear() {
    if (this.routeInfo.type) {
      this.__visible = false
    } else {
      this.__visible = true
    }
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Center }) {
        Image($r('app.media.robot_bg'))
          .objectFit(ImageFit.Cover)
        Text("").width("100%").height("100%").backgroundColor("#000").opacity(0.3)
        Text($r('app.string.MainAbility_label')).fontSize(30).fontWeight(800).fontColor('#FFFF')
      }.width("100%").height("40%")

      Flex({ justifyContent: FlexAlign.SpaceAround, wrap: FlexWrap.Wrap, alignContent: FlexAlign.SpaceAround }) {
        Column() {
          Image($r('app.media.ic_walk_model')).height(30).width(30)
          Text($r('app.string.index_walk_mode')).padding(this.__padding)
        }.width("40%").backgroundColor($r('app.color.bg_gray')).borderRadius(this.__border)

        Column() {
          Image($r('app.media.ic_work_model')).height(30).width(30)
          Text($r('app.string.index_work_mode')).padding(this.__padding)
        }.width("40%").backgroundColor($r('app.color.bg_gray')).borderRadius(this.__border).onClick(() => {
          router.pushUrl({url:"pages/work"})
        })

        if (this.__visible) {
          Column() {
            Image($r('app.media.ic_params_setting')).height(30).width(30)
            Text($r("app.string.index_param_setting")).padding(this.__padding)
          }.width("40%").backgroundColor($r('app.color.bg_gray')).borderRadius(this.__border)

          Column() {
            Image($r('app.media.ic_debug_model')).height(30).width(30)
            Text($r("app.string.index_debug")).padding(this.__padding)
          }.width("40%").backgroundColor($r('app.color.bg_gray')).borderRadius(this.__border)
        }
      }.width("100%").height("60%")

    }.width('100%').height("100%")
  }
}