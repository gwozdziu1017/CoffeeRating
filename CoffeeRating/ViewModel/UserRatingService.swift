//
//  UserRatingService.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 27/06/2025.
//
import SwiftUI

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

func addPriceRange(coffeeShop: inout CoffeeShopModel, priceRange: PriceRange) {
    coffeeShop.priceRange = priceRange // todo: price range should be calculated
}

func getUserRateView(userRating: UserRatingModel) -> some View {
    HStack {
        Text("User Rate")
        Picker("User Rate", selection: .constant(1)) {
            Image(systemName: "1.circle.fill")
                .onTapGesture {_ in
                    userRating.setRate(rate: 1)
                }
            Image(systemName: "2.circle.fill")
                .onTapGesture {_ in
                    userRating.setRate(rate: 2)
                }
            Image(systemName: "3.circle.fill")
                .onTapGesture {_ in
                    userRating.setRate(rate: 3)
                }
            Image(systemName: "4.circle.fill")
                .onTapGesture {_ in
                    userRating.setRate(rate: 4)
                }
            Image(systemName: "5.circle.fill")
                .onTapGesture {_ in
                    userRating.setRate(rate: 5)
                }
        }
    }
    
}

func getPriceRangeView(userRating: UserRatingModel) -> some View {
    HStack {
        Text("Price Range")
        Picker("Price Range", selection: .constant(1)) {
            ForEach(PriceRange.allCases) { price in
                Text(price.rawValue)
                    .onTapGesture {value in
                        userRating.setPriceRange(priceRange: price)
                    }
            }
        }
    }
}

//func submitRating(coffeeShop: inout CoffeeShopModel, userRating: UserRating) {
//    if userRating.isNewRatingSet {
//        addNewRate(coffeeShop: &coffeeShop, rate: userRating.rate!)
//    }
//    if userRating.isNewAmenitiesSet {
//        addAmenities(coffeeShop: &coffeeShop, amenities: userRating.amenities!)
//    }
//    if userRating.isNewPriceRangeSet {
//        addPriceRange(coffeeShop: &coffeeShop, priceRange: userRating.priceRange!)
//    }
//}
