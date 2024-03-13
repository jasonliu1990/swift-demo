//
//  ContentView.swift
//  FoodPicker
//
//  Created by 劉家達 on 2024/2/20.
//

import SwiftUI

struct ContentView: View {
    
    let food = ["麥當勞", "鬍鬚張", "全家", "MOS", "火鍋"]
    @State private var selectedFood: String?

    var body: some View {

        VStack (spacing: 30.0){
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("今天吃什麼?")
                .font(.largeTitle)
                .bold()
            
            if var selectedFood = selectedFood {
                Text(selectedFood)
                    .bold()
                    .foregroundColor(.green)
            }
            
            Button(role: .none) {
                selectedFood = food.shuffled().filter {
                    $0 != selectedFood}.first
            } label: {
                Text(selectedFood == .none ? "告訴我" : "換一個")
                    .frame(width: 200)
            }
                .buttonStyle(.borderedProminent)
                .padding(.bottom, -15)
            
            Button(role: .none) {
                selectedFood = .none
            } label: {
                Text("重置").frame(width: 200)
            }
    
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(.secondarySystemBackground))
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .font(.title)
        .padding()
        .animation(.easeInOut, value: selectedFood)
    }
}



#Preview {
    ContentView()
}
