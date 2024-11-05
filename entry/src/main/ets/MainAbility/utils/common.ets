// @ts-ignore
import uartapi from "@ohos.uartapi"
import Prompt from '@system.prompt';
export function generateRangeArray(minValue: number, maxValue: number, step: number) {
  const range: number[] = [];
  for (let i = minValue; i <= maxValue; i += step) {
    range.push(i);
  }
  return range.reverse();
}

export function generateRange(min: number, max: number) {
  const len = 10
  const range: number[] = []
  const gap = parseFloat(((max - min) / len).toFixed(1))
  let res = min
  //分割出区间
  for (let index = 0; index <= len; index++) {
    range.push(res)
    res += gap
  }
  return range.reverse();
}


export function openSerial():number {
  try {
    return uartapi.napi_open("/dev/ttyS3", 1);
  } catch (err) {
    console.log("====open serial failed!!")
    throw err
  }
}

export function writeSerial(fd: number, message: string) {
  try {
    Prompt.showToast({message:`${message} was send successfully`})
    return uartapi.napi_write(fd, message);
  } catch (err) {
    Prompt.showToast({message:`${message} write serial was failed!`})
    console.log("====write serial failed!!")
    throw err
  }
}

export function listenSerial(fd: object) {
  uartapi.napi_listenCallback(fd, (result) => {
    console.log(`===${JSON.stringify(result)}`);
  });
}

export function closeSerial(fd:number){
  uartapi.napi_close(fd)
}