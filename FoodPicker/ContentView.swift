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
    @State private var showInfo: Bool = false
    
    
    var body: some View {
        ScrollView {
            
            
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
                    HStack {
                        Text(selectedFood.name)
                            .bold()
                            .bold()
                            .foregroundColor(.green)
                            .id(selectedFood.name)
                        
                        Button {
                            showInfo.toggle()
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(.secondary)
                        }.buttonStyle(.plain)
                        
                    }
                    
                    Text("熱量 \(Int(selectedFood.calorie)) 大卡")
                    
                    VStack {
                        if showInfo {
                            Grid(horizontalSpacing: 12, verticalSpacing: 12){
                                GridRow {
                                    Text("蛋白質")
                                    Text("脂肪")
                                    Text("碳水")
                                }.frame(minWidth: 60)
                                Divider()
                                    .gridCellUnsizedAxes(.horizontal)
                                    .padding(.horizontal, -10)
                                GridRow {
                                    Text(selectedFood.protein.formatted() + "g")
                                    Text(selectedFood.fat.formatted() + "g")
                                    Text(selectedFood.carb.formatted() + "g")
                                }
                            }
                            .font(.title3)
                            .padding(.horizontal)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(Color(.systemBackground)))
                            .transition(.move(edge: .top).combined(with: .opacity))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .clipped()
                }
                Spacer().layoutPriority(1)  // 去延stack主要方向填滿 為了排版
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
                    showInfo = false
                } label: {
                    Text("重置").frame(width: 200)
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height - 100)  // 調整最大寬度,高度
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .animation(.spring(dampingFraction: 0.5), value: showInfo)
            .animation(.easeInOut, value: selectedFood)
        }.background(Color(.secondarySystemBackground))
    }
}

// 給 contentView 預設的 input
extension ContentView {
    init(selectedFood: Food) {
        _selectedFood = State(wrappedValue: selectedFood)
    }
}


#Preview {
    ContentView(selectedFood: .examples.first!)
}
