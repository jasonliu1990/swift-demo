// 1. Struct


struct Human: Equatable {
    static var population = 0
    var name: String
    private(set) var age = 20
    var height = 170
    
    init(name: String){
        self.name = name
        Self.population += 1  // 修改靜態屬性
    }
    
    init(name: String, age: Int, height: Int){
        self.name = name
        self.age = age
        self.height = height
        Self.population += 1 // 大寫 Self表示目前操作對象的類型
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name
    }
    
    // struct 本身是不可以被修改的
    // 如果有個 function想要修改自己的話
    // 就要用 mutating 變異
    mutating func birthday() {
        age += 1
        print("\(name) \(age)")
        if age < 15 {
            height += (0...5).randomElement()!
        }
    }
    
    // mutating 甚至可以改掉自己
    // 如果想要重置一個複雜的資料就可以用這個方法
    mutating func reborn() {
        self = Human(name: name)
    }
}


var person = Human(name: "Andy", age: 23, height: 173)
print(person)
print("population \(Human.population)")
var person2 = Human(name: "Andy")
print(person2)

print(person == person2)  // 加了 equatable才能比較

person.birthday()
print(person)
person.reborn()
print(person)


// struct 用途
// 歸納整理

struct PrinterManager {
    private init () {} // 避免用到 init

    static func alert (message: String) {
        print("warning \(message)")
    }
    
    static func hint (message: String) {
        print("hint \(message)")
    }
    
    static func ok (message: String) {
        print("ok \(message)")
    }
}

PrinterManager.alert(message: "地震！")
PrinterManager.hint(message: "HIHI")


// 作業
// 【ChaoCode】 Swift 中級 1：Struct 實作作業

// 1️⃣ 建立一個名為「手機」的類型
// 2️⃣ 設定屬性：用戶姓名 String、電話號碼 String、收件箱 [String]。
//            用戶姓名和電話號碼創建後不可更改。
//            收件箱預設為空，其他屬性沒有預設值，不能從外部更改。
// 3️⃣ 設定方法：
// 4️⃣ 設定兩個啟動方式：一個參數是用戶姓名和號碼；另一個參數是姓名，號碼是隨機產生。
// 5️⃣ 讓手機變成 Equatable，並且只比較「手機號碼」。

struct 手機: Equatable{
    let 用戶姓名: String
    let 電話號碼: String
    private(set) var 收件箱: [String] = []
    
    init(_ 用戶姓名: String, 號碼: String) {
        self.用戶姓名 = 用戶姓名
        電話號碼 = 號碼
    }
    
    init(_ 用戶姓名: String) {
        self.用戶姓名 = 用戶姓名
        電話號碼 = Self.隨機號碼()
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.電話號碼 == rhs.電話號碼
    }
    
    // 加入下列方法
    mutating func 收到訊息(_ 訊息: String) {
        // 在收件箱新增一筆訊息
        收件箱.append(訊息)
    }
    
    mutating func 轉移訊息(from 手機: 手機) {
        // 在現有收件箱中，新增引數的收件箱內容。引數的收件箱內容應在 Array 的前面。
        收件箱 = 手機.收件箱 + 收件箱
    }
    
    // 加入下列靜態方法
    static func 隨機號碼() -> String {
        // 方法內容不需改動
        "09" + Int.random(in: 10000000...99999999).description
    }

    
}
// 👇 你可以 uncomment 下面這行，嘗試檢查手機的收件箱是否能從外部更新，設定正確的話應該會顯示紅字報錯「Cannot assign to property: '收件箱' setter is inaccessible」。
//手機(用戶姓名: "Test").收件箱 = []

// 👇 請勿修改下方 Code，你應該在上面建立好 struct 讓以下 Code 能順利執行。

var 我的號碼 = 手機("Jane", 號碼: "0912345678")
我的號碼.收到訊息("寶貝：在幹麻")
我的號碼.收到訊息("媽媽：早安")

var 隨機新號碼 = 手機("Jane")
隨機新號碼.收到訊息("系統通知：您的號碼已開啟所有服務。")
隨機新號碼.轉移訊息(from: 我的號碼)
print("\(隨機新號碼.用戶姓名) 的新號碼：\(隨機新號碼.電話號碼)")
print(隨機新號碼.收件箱)

print("隨機號碼 \(手機.隨機號碼())")
let 我的號碼測試 = 手機("Amy", 號碼: "0912345678")
print("結果應為 true：\(我的號碼 == 我的號碼測試)")
