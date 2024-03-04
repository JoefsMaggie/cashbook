@Component
export struct Header {
  private title: ResourceStr

  build() {
    Row() {
      Image($r('app.media.startIcon'))
        .width(30)
      Text(this.title)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Blank()
      Image($r('app.media.startIcon'))
        .width(30)
    }
    .width('100%')
    .backgroundColor(Color.White)
    .height(50)
    // .margin(15)
  }
}