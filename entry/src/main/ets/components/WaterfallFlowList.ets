// // Extend放在全局，指定某种特定组件的样式
// @Extend(Text)
// function priceStyle() {
//   .fontColor(Color.Red)
//   .fontSize(18)
// }
//
// @Component
// struct WaterfallFlowList {
//   @Link list: Array<any>
//   btnName: string = '新增'
//   createData: () => any
//   itemList?: (item: any) => void
//
//   build() {
//     Column() {
//       Button(this.btnName)
//         .width(200)
//         .margin({ top: 20, bottom: 20 })
//         .onClick(() => {
//           this.list.push(this.createData)
//         })
//
//       // 列表
//       List({ space: 10 }) {
//         ForEach(this.list, (item: any, idx) => {
//           ListItem() {
//             this.itemCard(item)
//           }
//           // 设置左滑操作栏
//           .swipeAction({ end: this.delBtn(idx) })
//         })
//       }
//       .width('100%')
//       .layoutWeight(1)
//       .alignListItem(ListItemAlign.Center)
//     }
//   }
//
//   @Builder
//   delBtn(idx: number) {
//     Button() {
//       Image($r("app.media.i_del_3"))
//         .fillColor(Color.White)
//         .width(20)
//     }
//     .width(40)
//     .height(40)
//     .type(ButtonType.Circle)
//     .backgroundColor(Color.Red)
//     .margin(5)
//     .onClick(() => {
//       this.list.splice(idx, 1)
//     })
//   }
//
//   @Builder
//   itemCard(item: any) {
//     Row({ space: 30 }) {
//       this.itemList(item)
//     }
//     .width('100%')
//     .backgroundColor(Color.White)
//     .borderRadius(20)
//     .height(120)
//     .padding(10)
//   }
// }