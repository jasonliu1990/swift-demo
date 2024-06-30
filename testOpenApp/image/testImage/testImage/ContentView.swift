//
//  ContentView.swift
//  testImage
//
//  Created by ct on 2024/5/5.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // 檢查是否從 URL 啟動 App
        if let url = launchOptions?[.url] as? URL {
            handleURL(url)
        }
        return true
    }

    func handleURL(_ url: URL) {
        guard url.scheme == "appb" else { return }
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }

        var name = ""
        var age = ""
        var email = ""

        // 解析 URL 中的 query 參數
        if let queryItems = components.queryItems {
            for item in queryItems {
                switch item.name {
                case "name":
                    name = item.value ?? ""
                case "age":
                    age = item.value ?? ""
                case "email":
                    email = item.value ?? ""
                default:
                    break
                }
            }
        }

        // 將資訊傳遞給相應的 View 進行顯示
        if let viewController = UIApplication.shared.windows.first?.rootViewController as? ViewController {
            viewController.displayInfo(name: name, age: age, email: email)
        }
    }
}

struct ContentView: View {
    @State private var displayedName: String = ""
    @State private var displayedAge: String = ""
    @State private var displayedEmail: String = ""

    var body: some View {
        VStack {
            Text("姓名：\(displayedName)")
            Text("年齡：\(displayedAge)")
            Text("Email：\(displayedEmail)")
        }
        .padding()
    }
}



#Preview(windowStyle: .automatic) {
    ContentView()
}
