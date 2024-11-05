import { generateRange, generateRangeArray } from '../utils/common';
import { MyProgress } from './MyProgress';
import { MyRotate } from './MyRotate';
import {PanelType} from "../types/enums"

function stop() {
  console.log("停止升顶")
}

function toTop() {
  console.log("升顶")
}

function toBottom() {
  console.log("下降")
}

@Component
export struct panel {
  @Prop title: string;
  @State meta1: string = "预留位1"
  @State meta2: string = "预留位2"
  @State vInSetValueTwo: number = 0
  @Prop btn1: string;
  @Prop btn2: string;
  @Prop btn3: string;
  @Prop panelType:number;

  build() {

    Column() {
      Row() {
        Text(this.title).padding({ top: 20 })
      }

      Row() {
        Text(this.meta1)
        Text("|").padding(10)
        Text(this.meta2)
      }

      Row() {
        if (this.panelType === PanelType.rotate){
          MyRotate()
        }else{
          MyProgress()
        }
      }
      .height("50%")
      .width("60%")

      Column() {
        Button(this.btn1, { type: ButtonType.Normal }).fontSize(10).borderRadius(5).height(24).onClick(toTop)
        Button(this.btn2, { type: ButtonType.Normal }).fontSize(10).borderRadius(5).height(24).onClick(stop)
        Button(this.btn3, { type: ButtonType.Normal }).fontSize(10).borderRadius(5).height(24).onClick(toBottom)
      }
      .width("60%")
      .height("30%")
      .justifyContent(FlexAlign.SpaceAround)
    }.width(150).height("100%").backgroundColor("#f1f2f3")
  }
}



