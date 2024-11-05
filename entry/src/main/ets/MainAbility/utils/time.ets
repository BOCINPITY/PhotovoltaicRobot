
let date = new Date
export function getTime(): string {
  return (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':' + (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes())
}

export function getSeconds(): string {
  return ':' + (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds())
}