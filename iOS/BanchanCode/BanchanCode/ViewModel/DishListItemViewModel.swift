//
//  DishListItemViewModel.swift
//  BanchanCode
//
//  Created by Song on 2021/04/23.
//

import Foundation

struct DishListItemViewModel {
    let name: String
    let description: String
    let imageURL: String
    let prices: [Int]
    let badges: [String]
}

extension DishListItemViewModel {
    init(dish: Dish) {
        self.name = dish.name
        self.description = dish.description
        self.imageURL = dish.imageURL
        self.prices = dish.prices
        self.badges = dish.badges
    }
}
