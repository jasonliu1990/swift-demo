//
//  Food.swift
//  FoodPicker
//
//  Created by CT on 2024/3/13.
//

struct Food: Equatable{
    var name: String
    var image: String
    var calorie: Double
    var carb: Double
    var fat: Double
    var protein: Double
    
    static let examples = [
        Food(name: "pizza", image: "🍕", calorie: 266, carb: 33, fat: 10, protein: 11),
        Food(name: "burger", image: "🍔", calorie: 294, carb: 14, fat: 24, protein: 17),
        Food(name: "hot pot", image: "🥘", calorie: 233, carb: 26.5, fat: 17, protein: 22),
        Food(name: "noodle", image: "🍜", calorie: 256, carb: 56, fat: 1, protein: 8),
        Food(name: "spaghetti", image: "🍝", calorie: 339, carb: 74, fat: 1, protein: 12),
        Food(name: "beef noodle", image: "🐮🍜", calorie: 432, carb: 56, fat: 12, protein: 20)
    ]
}

