export enum robotFunctionType {
  walkMode,
  workMode,
  paramSetMode,
  debugMode
}

export enum userType {
  admin,
  operator
}

export enum FROperationButton {
  rotate,
  stop,
  toBottom
}

export enum PanelType {
  rotate,
  hoist
}


export  enum MSG_CMD {
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
  OneClickPileHolding = 'One-click pile holding'
}








//抱桩夹爪升降
export enum PileClampsClawLifting {

  raise = 0x01060004FF9C, //抬升
  decline = 0x010600040064, //下降
  stop = 0x010600040000, //停止
}
//抱桩夹爪夹紧
enum GripThePileGripperJawClamping {
  open = 0x12060004FF9C, //张开
  Clamping = 0x120600040064, //夹紧
  stop = 0x120600040000, //停止
}
// 车身前后调平
enum TheBodyIsLeveledFrontAndRear {
  Jacking = 0x0306004001F4, //顶升
  decline = 0x03060040FE0C, //下降
  stop = 0x030600400000 //停止
}
//门升降
enum DoorLifting {
  //一级门
  level1Jacking = 0x0406004003E7,
  level1Decline = 0x0406004003E7,
  level1Stop = 0x0406004003E7,
  //二级门
  level2Jacking = 0x0506004003E7,
  level2Decline = 0x0506004003E7,
  level2Stop = 0x0506004003E7,
  //三级门
  level3Jacking = 0x0606004003E7,
  level3Decline = 0x0606004003E7,
  level3Stop = 0x0606004003E7,
}

//门架旋转
enum TheMastRotates{
  toZero = 0x070660020011,
  EmergencyStop = 0x0660020040
}
enum Ultrasonic{
  readProcessed = 0X090301000001,
  readRealTime = 0X090301010001
}