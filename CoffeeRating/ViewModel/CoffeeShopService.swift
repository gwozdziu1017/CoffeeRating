//
//  CoffeeShopService.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 27/06/2025.
//
import SwiftUI

func getAverageRating(ratingArray: [Int]) -> Double {
    return Double(ratingArray.reduce(0, +)) / Double(ratingArray.count)
}

func getTotalNumberOfRatings(ratingArray: [Int]) -> Int {
    return ratingArray.count
}

func getIsOpenNow(openingHours: DaySchedule) -> Bool {
    let date = Date()
    let hourNow = Calendar.current.component(.hour, from: date)

    let dateFormatter = DateFormatter()

    let openHourDate = Calendar.current.component(
        .hour, from: dateFormatter.date(
            from: openingHours.openingTime)!)
    let closedHourDate = Calendar.current.component(
        .hour, from: dateFormatter.date(
            from: openingHours.closingTime)!)

    return (hourNow >= openHourDate) && (hourNow < closedHourDate)
}

func getCoffeShopNameAddressPhoneNumberView(coffeeShop: CoffeeShopModel) -> some View {
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

func getCoffeeShopPriceRangeAmenitiesView(priceRange: PriceRange, amenities: [Amenity]) -> some View {
    VStack(alignment: .leading){
        Text("Price range: \(priceRange)")
            .font(.caption)
        HStack {
            Text("Amenities:")
            getAmenitiesAsImages(amenities: amenities)
        }
    }
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

func getCoffeeShopAverageRatngIsOpenNowView(averageRating: Double, isOpenNow: Bool) -> some View {
    VStack(alignment: .leading) {
        HStack {
            Text("Average rating:")
                .font(.caption)
            getAverageRatingAsStars(averageRating: averageRating)
        }
        isOpenNow ? getOpenNowText() : getClosedNowText()
    }
}

func getCoffeeShopOpeningHoursView(openingHours: [DaySchedule]) -> some View {
    HStack{
        Text("Opening hours:")
        getReadableOpeningHours(openingHours: openingHours)
    }
}

func getCoffeeShopTotalNumberOfRatingsView(totalNumberOfRatings: Int) -> some View {
    VStack(alignment: .leading) {
        Text("Total number of ratings: \(totalNumberOfRatings)")
            .font(.caption)
    }
}

func getImageStarFill() -> Image {
    return Image(systemName: "star.fill")
}

func getImageStarEmpty() -> Image {
    return Image(systemName: "star")
}

func getImageStarHalfFill() -> Image {
    return Image(systemName: "star.leadinghalf.filled")
}

func getAverageRatingAsStars(averageRating: Double) -> some View {
    HStack {
        let ratingScoreInt: Int = Int(averageRating)
        let isHalfStar: Bool = averageRating > Double(ratingScoreInt) ? true : false
        
        ForEach(0..<5) {starNo in
            if(starNo < ratingScoreInt) {
                getImageStarFill()
            }
            if isHalfStar && starNo == ratingScoreInt{
                getImageStarHalfFill()
            }
            if starNo > ratingScoreInt {
                getImageStarEmpty()
            }
        }
    }
}

func getAmenitiesAsImages(amenities: [Amenity]) -> some View {
    HStack {
        ForEach(amenities) { amenity in
            Image(systemName: amenity.imageName)
        }
    }
}
func getReadableOpeningHours(openingHours: [DaySchedule]) -> some View {
    VStack{
        ForEach(openingHours) { day in
            Text(day.print())
        }
    }
}
