@Component
export struct operation {
  @State __padding: number = 5
  @State __fontSize_base: number = 12
  @State __btn_borderRadius: number = 5
  @Prop mode: string
  @State __height: number = 35
  private itemOnNextClick = (event: ClickEvent) => {
  } //item的单击事件（可选）
  private itemOnPreviousClick = (event: ClickEvent) => {

  }
  private itemOnBackHomeClick = (event: ClickEvent) => {

  }

  build() {
    Row({ space: 10 }) {
      if (this.mode === 'both') {
        Row() {
          Image($r("app.media.arrow_left")).width(20).height(20)
          Text('上一层').fontSize(this.__fontSize_base)
        }
        .backgroundColor($r("app.color.color_primary"))
        .padding({ top: this.__padding, bottom: this.__padding, right: this.__padding })
        .borderRadius(this.__btn_borderRadius)
        .height(this.__height)
        .onClick((event: ClickEvent) => {
          this.itemOnPreviousClick(event)
        })

        Row() {
          Text('下一步').fontSize(this.__fontSize_base).fontColor($r("app.color.start_window_background"))
          Image($r("app.media.arrow_right")).width(20).height(20)
        }
        .backgroundColor($r("app.color.black"))
        .padding({ top: this.__padding, bottom: this.__padding, left: this.__padding })
        .borderRadius(this.__btn_borderRadius)
        .height(this.__height)
        .onClick((event: ClickEvent) => {
          this.itemOnNextClick(event)
        })
      }
      if (this.mode === 'onlyPre') {
        Row() {
          Image($r("app.media.arrow_left")).width(20).height(20)
          Text('上一层').fontSize(this.__fontSize_base)
        }
        .backgroundColor($r("app.color.color_primary"))
        .padding({ top: this.__padding, bottom: this.__padding, right: this.__padding })
        .borderRadius(this.__btn_borderRadius)
        .height(this.__height)
        .onClick((event: ClickEvent) => {
          this.itemOnPreviousClick(event)
        })
      }
      if (this.mode === 'onlyNext') {
        Row() {
          Text('下一步').fontSize(this.__fontSize_base).fontColor($r("app.color.start_window_background"))
          Image($r("app.media.arrow_right")).width(20).height(20)
        }
        .backgroundColor($r("app.color.black"))
        .padding({ top: this.__padding, bottom: this.__padding, left: this.__padding })
        .borderRadius(this.__btn_borderRadius)
        .height(this.__height)
        .onClick((event: ClickEvent) => {
          this.itemOnNextClick(event)
        })
      }
      if (this.mode === 'last') {
        Row() {
          Image($r("app.media.arrow_left")).width(20).height(20)
          Text('上一层').fontSize(this.__fontSize_base)
        }
        .backgroundColor($r("app.color.color_primary"))
        .padding({ top: this.__padding, bottom: this.__padding, right: this.__padding })
        .borderRadius(this.__btn_borderRadius)
        .height(this.__height)
        .onClick((event: ClickEvent) => {
          this.itemOnPreviousClick(event)
        })

        Row() {
          Text('返回主页').fontSize(this.__fontSize_base).fontColor($r("app.color.start_window_background"))
          Image($r("app.media.home")).width(20).height(20)
        }
        .backgroundColor($r("app.color.black"))
        .padding({ top: this.__padding, bottom: this.__padding, left: this.__padding })
        .borderRadius(this.__btn_borderRadius)
        .height(this.__height)
        .onClick((event: ClickEvent) => {
          this.itemOnBackHomeClick(event)
        })
      }
    }
  }
}