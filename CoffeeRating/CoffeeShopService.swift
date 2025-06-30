//
//  CoffeeShopService.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 27/06/2025.
//
import Foundation

let mockedCoffeeShopRatings: [Int] = [5, 5, 5, 4, 3, 1, 1]
let mockedOpeningHours: [DaySchedule] = [
    DaySchedule(dayOfTheWeek: "Monday", openingTime: "08:00", closingTime: "20:00"),
    DaySchedule(dayOfTheWeek: "Tuesday", openingTime: "12:00", closingTime: "18:00")
]
func getMockedIsOpenNow(isOpen: Bool) -> Bool {
    return isOpen
}

let mockedCoffeeShop: CoffeeShopModel =
    .init(
        name: "Starbucks",
        address: "123 Main Street, Anytown, USA",
        latitude: 32.6514,
        longitude: -161.4333,
        phoneNumber: "(123) 456-7890",
        isOpenNow: getMockedIsOpenNow(isOpen: true),
        openingHours: mockedOpeningHours,
        amenities: [.wifi, .parking, .petFriendly],
        priceRange: .moderate,
        averageRating: getAverageRating(ratingArray: mockedCoffeeShopRatings),
        totalNumberOfRatings: getTotalNumberOfRatings(ratingArray: mockedCoffeeShopRatings))

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
