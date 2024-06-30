// swift 202
// 計算屬性 ＆ 屬性觀察
// * 計算屬性 computed property
// * 屬性觀察 peoperty observers
// * set, get, didSet, willSet

// 計算屬性
// 1. var
// 2. 不可省略類型
// 3. get or get and set
struct item {
    let listPrice = 100.0
    var discount = 0.8
    var salePrict: Double {
        set { discount = newValue / listPrice }
        get { listPrice * discount }
    }
}

var book = item()
book.salePrict = 50
print(book)


// 屬性觀察
// willSet 即將改變時
// didSet 改變後
struct item2 {
    let listPrice = 100.0
    var discount = 0.8 {
        willSet {
            print("改變折扣為 \(newValue)，暫停販售")
        }
        didSet {
            print("折扣從 \(oldValue) 調整成 \(discount)")
        }
    }
    var salePrict: Double {listPrice * discount }
}

var book2 = item2()
book2.discount = 0.7
print(book2)

