//
//  UserRatingService.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 27/06/2025.
//
import Foundation

func calculateNewAverageRating(coffeeShop: CoffeeShopModel, newRate: Int) -> Double {
    return coffeeShop.averageRating + (Double(newRate) - coffeeShop.averageRating) / Double(coffeeShop.totalNumberOfRatings + 1)
}

func addNewRate(coffeeShop: inout CoffeeShopModel, rate: Int) {
    coffeeShop.averageRating = calculateNewAverageRating(coffeeShop: coffeeShop, newRate: rate)
    coffeeShop.totalNumberOfRatings += 1
}

/*
 func updateRate(coffeeShop: inout CoffeeShopModel, newRate: Int) {
    not sure if i'll be able to update it when i don't store array of ratings
    becuse i'd need to remove old one and add new one
}
*/

func addAmenities(coffeeShop: inout CoffeeShopModel, amenities: [Amenity]) {
    coffeeShop.amenities.formUnion(amenities)
}
