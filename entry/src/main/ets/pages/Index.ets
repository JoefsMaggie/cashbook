console.log("test")

let a: number = 1
console.log(a.toString())
const b = '2'
console.log(b)

let arr = ["1"]
console.log(arr.toString())
arr[0] = '2'
console.log(arr.toString())
arr[1] = '3'
console.log(arr.toString())

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    // RowSplit() {
    //   Row() {
    //     Column() {
    //       Image('https://kanliao6.net/usr/uploads/2024/02/306952334.jpg')
    //         .width(50)
    //       Text('test')
    //         .width(50)
    //       Row() {
    //         Image($r('app.media.icon'))
    //           .width(50)
    //         Text('my test')
    //       }
    //     }
    //   }
      Row() {
        Column() {
          Text(this.message)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
      }
      .height('50%')
    // }
  }
}