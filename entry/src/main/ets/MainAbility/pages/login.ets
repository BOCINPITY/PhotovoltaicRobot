import featureAbility from '@ohos.ability.featureAbility';
import data_preferences from '@ohos.data.preferences';
import router from '@ohos.router';
import Prompt from '@system.prompt';
import bundle from '@ohos.bundle';

let context = featureAbility.getContext();
let preferences = null;


async function login(username: string, password: string, usertype: number) {
  if (username === '' || password === '') {
    Prompt.showToast({ message: "请输入账号密码" })
    return
  }
  //登录逻辑
  //省略
  preferences = await data_preferences.getPreferences(context, 'store') //从首选项中获取仓库
  await preferences.put(username, usertype) //将用户信息存储到仓库当中
  router.replaceUrl({ url: "pages/index", params: { username:username,type:usertype }, }) //跳转到index界面
}

@Entry
@Component
struct Login {
  @State username: string = ''
  @State password: string = ''
  controller: TextInputController = new TextInputController()

  aboutToAppear() {
    context.setDisplayOrientation(bundle.DisplayOrientation.UNSPECIFIED)
  }

  build() {
    Column() {
      Column({ space: 5 }) {
        Stack({ alignContent: Alignment.Center }) {
          Image($r('app.media.robot_bg'))
            .objectFit(ImageFit.Cover)
          Text("").width("100%").height("100%").backgroundColor("#000").opacity(0.3)
          Text($r('app.string.MainAbility_label')).fontSize(30).fontWeight(800).fontColor('#FFFF')
        }.width("100%").height("40%")

        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
          Flex({ alignItems: ItemAlign.Center }) {
            Text($r('app.string.login_username')).width(100).fontSize(14).textAlign(TextAlign.Center)
            TextInput({ placeholder: $r("app.string.please_input_your_username"), controller: this.controller,text:"admin" })
              .placeholderColor(Color.Grey)
              .placeholderFont({ size: 14, weight: 400 })
              .caretColor(Color.Blue)
              .height(40)
              .margin(10)
              .fontSize(14)
              .borderRadius(8)
              .fontColor(Color.Black)
              .onChange((value: string) => {
                this.username = value
              })
          }.width("100%")

          Flex({ alignItems: ItemAlign.Center }) {
            Text($r('app.string.login_pwd')).width(100).fontSize(14).textAlign(TextAlign.Center)
            TextInput({ placeholder: $r("app.string.please_input_your_password"), controller: this.controller,text:"123456"  })
              .placeholderColor(Color.Grey)
              .placeholderFont({ size: 14, weight: 400 })
              .caretColor(Color.Blue)
              .height(40)
              .margin(10)
              .fontSize(14)
              .borderRadius(8)
              .fontColor(Color.Black)
              .onChange((value: string) => {
                this.password = value
              })
          }.width("100%")

          Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
            Button($r('app.string.login_admin'), { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .fontSize(14)
              .height(50)
              .onClick(() => login(this.username, this.password, 0))
            Button($r('app.string.login_operator'), { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .fontSize(14)
              .height(50)
              .onClick(() => login(this.username, this.password, 1))
          }.width("100%").margin(20)

        }
        .height('100%')
        .width('100%')
        .padding(10)
        .backgroundColor('#F1F2F3')
      }.width('100%').margin({ top: 5 })
    }.width('100%')
  }
}