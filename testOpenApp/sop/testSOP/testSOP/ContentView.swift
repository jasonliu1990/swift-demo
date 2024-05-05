//
//  ContentView.swift
//  testSOP
//
//  Created by ct on 2024/5/5.
//

import SwiftUI


struct ContentView: View {
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var email: String = ""

    var body: some View {
        VStack {
            TextField("姓名", text: $name)
                .padding()
            TextField("年齡", text: $age)
                .padding()
                .keyboardType(.numberPad)
            TextField("Email", text: $email)
                .padding()
            Button(action: {
                openAppB(name: name, age: age, email: email)
            }) {
                Text("Submit")
            }
        }
    }

    func openAppB(name: String, age: String, email: String) {
        if let url = URL(string: "testimage://?name=\(name)&age=\(age)&email=\(email)") {
            UIApplication.shared.open(url)
        }
    }
}
