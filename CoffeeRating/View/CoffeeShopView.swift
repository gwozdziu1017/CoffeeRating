//
//  CoffeeShopView.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 03/07/2025.
//
import SwiftUI

// coffee shop details
func getCoffeeShopDetailsView(coffeeShop: CoffeeShopModel) -> some View {
    ZStack{
        VStack {
            HStack{
                getCoffeShopNameAddressPhoneNumberView(coffeeShop: coffeeShop)
                getCoffeeShopAverageRatngIsOpenNowView(averageRating: coffeeShop.averageRating, isOpenNow: coffeeShop.isOpenNow)
            }
            getCoffeeShopOpeningHoursView(openingHours: coffeeShop.openingHours)
            getCoffeeShopPriceRangeAmenitiesView(priceRange: coffeeShop.priceRange, amenities: coffeeShop.amenities)
            getCoffeeShopTotalNumberOfRatingsView(totalNumberOfRatings: coffeeShop.totalNumberOfRatings)
        }
    }
}

#Preview {
    getCoffeeShopDetailsView(coffeeShop: mockedCoffeeShop_1)
}
