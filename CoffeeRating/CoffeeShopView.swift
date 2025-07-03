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
                getCoffeShopNameAddressPhoneNumberInfoView(coffeeShop: coffeeShop)
                getCoffeeShopAverageRatngIsOpenNowView(coffeeShop: coffeeShop)
            }
            getCoffeeShopOpeningHoursView(coffeeShop: coffeeShop)
            getCoffeeShopPriceRangeAmenitiesView(coffeeShop: coffeeShop)
            getCoffeeShopTotalNumberOfRatingsView(coffeeShop: coffeeShop)
            temp(coffeeShop: coffeeShop)
        }
    }
}

func getCoffeShopNameAddressPhoneNumberInfoView(coffeeShop: CoffeeShopModel) -> some View {
    HStack {
        VStack(alignment: .leading) {
            Text(coffeeShop.name)
                .font(.headline)
            Text(coffeeShop.address)
                .font(.caption)
            Text(coffeeShop.phoneNumber)
                .font(.caption)
        }
    }
}

func getCoffeeShopPriceRangeAmenitiesView(coffeeShop: CoffeeShopModel) -> some View {
    VStack(alignment: .leading){
        Text("Price range: \(coffeeShop.priceRange)")
            .font(.caption)
        HStack {
            Text("Amenities:")
            getAmenitiesAsImages(coffeeShop: coffeeShop)
        }
    }
    .padding(.top)
}

func getOpenNowText() -> Text {
    Text("Open now")
        .font(.caption)
        .foregroundColor(.green)
}

func getClosedNowText() -> Text {
    Text("Closed now")
        .font(.caption)
        .foregroundColor(.red)
}

func getCoffeeShopAverageRatngIsOpenNowView(coffeeShop: CoffeeShopModel) -> some View {
    VStack(alignment: .leading) {
        HStack {
            Text("Average rating:")
                .font(.caption)
            getAverageRatingAsStars(coffeeShop: coffeeShop)
        }
        coffeeShop.isOpenNow ? getOpenNowText() : getClosedNowText()
    }
}

func getCoffeeShopOpeningHoursView(coffeeShop: CoffeeShopModel) -> some View {
    HStack{
        Text("Opening hours:")
        getReadableOpeningHours(coffeeShop: coffeeShop)
    }
}

func getCoffeeShopTotalNumberOfRatingsView(coffeeShop: CoffeeShopModel) -> some View {
    VStack(alignment: .leading) {
        Text("Total number of ratings: \(coffeeShop.totalNumberOfRatings)")
            .font(.caption)
    }
}

func getAverageRatingAsStars(coffeeShop: CoffeeShopModel) -> some View {
    HStack {
        let ratingScoreInt: Int = Int(coffeeShop.averageRating)
        let isHalfStar: Bool = coffeeShop.averageRating > Double(ratingScoreInt) ? true : false
        
        ForEach(0..<5) {a in
            if(a < ratingScoreInt) {
                Image(systemName: "star.fill")
            }
            if isHalfStar && a == ratingScoreInt{
                Image(systemName: "star.leadinghalf.filled")
            }
            if a > ratingScoreInt {
                Image(systemName: "star")
            }
        }
    }
}
func temp(coffeeShop: CoffeeShopModel) -> some View {
    VStack {

    }
}

func getAmenitiesAsImages(coffeeShop: CoffeeShopModel) -> some View {
    HStack {
        ForEach(coffeeShop.amenities) { amenity in
            Image(systemName: amenity.imageName)
        }
    }
}
func getReadableOpeningHours(coffeeShop: CoffeeShopModel) -> some View {
    VStack{
        ForEach(coffeeShop.openingHours) { day in
            Text(day.print())
        }
    }
}

#Preview {
    getCoffeeShopDetailsView(coffeeShop: mockedCoffeeShop_1)
}
