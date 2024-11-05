export enum MSG_CMD {
  //抱桩夹爪夹紧
  OpenTheGripper = 'Open the gripper', //打开抓夹
  TheGripperStops = 'The gripper stops', //抓夹停止
  CloseTheGripper = 'Close the gripper', //关闭抓夹
  //抱桩夹爪升降
  LiftTheGripper = 'Lift the gripper', //抬升抓夹
  StopLifting = 'Stop lifting', //停止升降
  DropTheGripper = 'Drop the gripper', //下降抓夹
  //车身前后调平
  cartJacking = '03Jacking',
  cartStop = '03stop',
  cartDecline = '03Decline',
  OneClickPileHolding = 'One-click pile holding',
  //门架抬升界面
  OneClickToTurnItUp = 'One-click to turn it up', //一键抬高
  OneClickStop = 'One-click stop', //一键停止
  //斜梁夹爪伸缩
  threeStageGantryLifting = 'threeStageGantryLowering', //三级门架抬升
  threeStageGantryStop = 'threeStageGantryStop', //三级门架停止
  threeStageGantryLowering = 'threeStageGantryLowering', //三级门架下降
  //
  Ob_inclinedBeamGripperExtension = '0b_inclinedBeamGripperRetraction', //斜梁夹爪伸出
  Ob_inclinedBeamGripperStop = '0b_inclinedBeamGripperStop', //斜梁夹爪停止
  Ob_inclinedBeamGripperRetraction = '0b_inclinedBeamGripperRetraction', //斜梁夹爪缩回
  //
  Oc_inclinedBeamGripperClamping = 'Oc_inclinedBeamGripperClamping', //斜梁夹爪夹紧
  Oc_inclinedBeamGripperStop = 'Oc_inclinedBeamGripperStop', //斜梁夹爪停止
  Oc_inclinedBeamGripperOpening = 'Oc_inclinedBeamGripperOpening', //斜梁夹爪张开

}