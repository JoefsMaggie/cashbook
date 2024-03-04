import HashMap from '@ohos.util.HashMap'
import { Header } from '../components/Header'

class BillType {
  id: number
  parent: number
  name: string
  icon: string | Resource

  constructor(id: number, parent: number, name: string, icon: string | Resource) {
    this.id = id
    this.parent = parent
    this.name = name
    this.icon = icon
  }
}

class Bill {
  id: number
  billTypeId: number
  price: number
  datetime: number
  images: Array<string | Resource>

  constructor(id: number, billTypeId: number, price: number, datetime: number, images: Array<string | Resource>) {
    this.id = id
    this.billTypeId = billTypeId
    this.price = price
    this.datetime = datetime
    this.images = images
  }
}

let billTypeMap = new HashMap<number, BillType>()
let billType = new BillType(1, null, '饮食', $r('app.media.app_icon'))
billTypeMap.set(1, billType)

// Extend放在全局，指定某种特定组件的样式
@Extend(Text)
function priceStyle() {
  .fontColor(Color.Red)
  .fontSize(18)
}

@Entry
@Component
struct Ledger {
  @State bills: Array<Bill> = [
    new Bill(1, 1, 20.0, 20240101, [$r('app.media.921d0f6fly1h5zgmb9s2gj20ug1hcb29')]),
    new Bill(2, 1, 20.0, 20240101, [$r('app.media.921d0f6fly1h5zgmagaiaj20ug1hce81')]),
    new Bill(3, 1, 20.0, 20240101, [$r('app.media.921d0f6fly1h5zgm9xqdsj20ug1hckjl')]),
    new Bill(4, 1, 20.0, 20240101, [$r('app.media.921d0f6fly1h5zgmaw7yij20ug1hce81')]),
  ]

  build() {

    Column() {
      // 页头
      Header({ title: '账单列表' })

      Button('新增')
        .width(200)
        .margin({ top: 20, bottom: 20 })
        .onClick(() => {
          this.bills.push(new Bill(this.bills.length + 1, 1, 20.0, 20240101, [$r('app.media.921d0f6fly1h5zgmb9s2gj20ug1hcb29')]))
        })

      // 列表
      List({ space: 10 }) {
        ForEach(this.bills, (item: Bill, idx) => {
          ListItem() {
            this.itemCard(item)
          }
          // 设置左滑功能
          .swipeAction({ end: this.deleteBtn(idx) })
        })
      }
      .width('100%')
      .padding(10)
      .layoutWeight(1)
      .alignListItem(ListItemAlign.Center)
    }
    .fillScreen()
  }

  @Builder
  deleteBtn(idx: number) {
    Button() {
      Image($r("app.media.i_del_3"))
        .fillColor(Color.White)
        .width(20)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(5)
    .onClick(() => {
      this.bills.splice(idx, 1)
    })
  }

  @Builder
  itemCard(item: Bill) {
    Row({ space: 30 }) {
      Column() {
        Text(item.datetime.toString())
      }.width(75)

      Column() {
        // Image(billTypeMap.get(item.billTypeId).icon)
        // Text(billTypeMap.get(item.billTypeId).name)
        Image(billType.icon).width(30)
        Text(billType.name)
      }.width(50)

      Blank()
      Column() {
        Text('$' + item.price.toString())
          .priceStyle()
      }
    }
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(20)
    .height(120)
    .padding(10)
  }

  @Styles
  fillScreen() {
    .backgroundColor('#eee')
    .width('100%')
    .height('100%')
  }
}
