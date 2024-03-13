//
//  ContentView.swift
//  FoodPicker
//
//  Created by CT on 2024/2/20.
//

import SwiftUI

struct ContentView: View {
    
    let food = Food.examples
    @State private var selectedFood: Food?


    var body: some View {

        VStack (spacing: 30.0){

            Group {  // 用來給予裡面的view同樣的調整器
                if let selectedFood = selectedFood {
                    Text(selectedFood.image)
                        .font(.system(size: 200))  // 字體大小
                        .minimumScaleFactor(0.5)  // 顯示空間不夠，願意縮小幾％
                        .lineLimit(1)  // 最多接受用幾行顯示
                    
                } else {
                    Image("dinner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .frame(height: 250)
            .border(.red)
            
            Text("今天吃什麼?")
                .font(.largeTitle)
                .bold()
            
            if let selectedFood = selectedFood {
                Text(selectedFood.name)
                    .bold()
                    .foregroundColor(.green)
            }
            Spacer()  // 去延stack主要方向填滿
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
        .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(.secondarySystemBackground))
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .font(.title)
        .animation(.easeInOut, value: selectedFood)
    }
}



#Preview {
    ContentView()
}
