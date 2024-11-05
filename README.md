# README
客户端基于dayu200开发板进行开发
操作系统：openharmony3.2
ℹ️主要是通过串口与hi3861进行通信，实际并未对napi进行核心能力开发,注意在huaweiSDK目录新增该接口定义文件
```typescript
import { AsyncCallback, Callback } from './basic'

declare namespace uartapi {

/**
 * DataAbilityHelper
 * @syscap SystemCapability.Ability.AbilityRuntime.FAModel
 *
 * @since 9
 * @FAModelOnly
 */
  function napi_open(portName: string, speed: number): number;

  function napi_write(fd: number, str: string): number;

  function napi_close(fd: number): number;

  function napi_listenCallback(fd: number, callback: AsyncCallback<string>): void;

}

export default uartapi;

```
