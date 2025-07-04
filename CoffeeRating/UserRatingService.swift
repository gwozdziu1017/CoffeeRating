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

func addAmenities(coffeeShop: inout CoffeeShopModel, amenities: [Amenity]) {
    coffeeShop.amenities = amenities
}
