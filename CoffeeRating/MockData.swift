//
//  MockData.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 01/07/2025.
//

/*
 Mocked data
*/
import MapKit

let mockedCoffeeShopRatings: [Int] = [5, 5, 5, 4, 3, 1, 1]
let mockedCoffeeShopRatingAll5: [Int] = [5, 5, 5]

let mockedOpeningHours: [DaySchedule] = [
    DaySchedule(dayOfTheWeek: "Monday", openingTime: "08:00", closingTime: "20:00"),
    DaySchedule(dayOfTheWeek: "Tuesday", openingTime: "12:00", closingTime: "18:00")
]
let mockedOpeningHoursOpenedEveryDay: [DaySchedule] = [
    DaySchedule(dayOfTheWeek: "Monday", openingTime: "08:00", closingTime: "20:00"),
    DaySchedule(dayOfTheWeek: "Tuesday", openingTime: "12:00", closingTime: "18:00"),
    DaySchedule(dayOfTheWeek: "Wednesday", openingTime: "12:00", closingTime: "18:00"),
    DaySchedule(dayOfTheWeek: "Thursday", openingTime: "12:00", closingTime: "18:00"),
    DaySchedule(dayOfTheWeek: "Friday", openingTime: "12:00", closingTime: "22:00"),
    DaySchedule(dayOfTheWeek: "Saturday", openingTime: "12:00", closingTime: "22:00"),
    DaySchedule(dayOfTheWeek: "Sunday", openingTime: "12:00", closingTime: "18:00")
]

func getMockedIsOpenNow(isOpen: Bool) -> Bool {
    return isOpen
}

let coffeeShopCoordinate_1: CLLocationCoordinate2D = .init(latitude: 51.7499, longitude: 19.3333)
let coffeeShopCoordinate_2: CLLocationCoordinate2D = .init(latitude: 51.746925, longitude: 19.335651)
let coffeeShopCoordinate_3: CLLocationCoordinate2D = .init(latitude: 51.75935, longitude: 19.35252)

let coffeeShopCoordinatesList : [CLLocationCoordinate2D] = [coffeeShopCoordinate_1, coffeeShopCoordinate_2, coffeeShopCoordinate_3]

let mockedCoffeeShop_1: CoffeeShopModel =
    .init(
        name: "Starbucks",
        address: "123 Main Street, Anytown, USA",
        latitude: coffeeShopCoordinatesList[0].latitude,
        longitude: coffeeShopCoordinatesList[0].longitude,
        phoneNumber: "(123) 456-7890",
        isOpenNow: getMockedIsOpenNow(isOpen: true),
        openingHours: mockedOpeningHours,
        amenities: [.wifi, .parking, .petFriendly],
        priceRange: .Moderate,
        averageRating: getAverageRating(ratingArray: mockedCoffeeShopRatings),
        totalNumberOfRatings: getTotalNumberOfRatings(ratingArray: mockedCoffeeShopRatings))

let mockedCoffeeShop_2: CoffeeShopModel =
    .init(
        name: "Dunkin' Donuts",
        address: "456 Elm Street, Anytown, USA",
        latitude: coffeeShopCoordinatesList[1].latitude,
        longitude: coffeeShopCoordinatesList[1].longitude,
        phoneNumber: "(098) 765-4321",
        isOpenNow: getMockedIsOpenNow(isOpen: false),
        openingHours: mockedOpeningHours,
        amenities: [.wifi, .petFriendly],
        priceRange: .Premium,
        averageRating: getAverageRating(ratingArray: mockedCoffeeShopRatings),
        totalNumberOfRatings: getTotalNumberOfRatings(ratingArray: mockedCoffeeShopRatings))

let mockedCoffeeShop_3: CoffeeShopModel =
    .init(
        name: "Na rondzie",
        address: "Rondo kolo osiedla 23",
        latitude: coffeeShopCoordinatesList[2].latitude,
        longitude: coffeeShopCoordinatesList[2].longitude,
        phoneNumber: "(555) 123-4567",
        isOpenNow: getMockedIsOpenNow(isOpen: false),
        openingHours: mockedOpeningHoursOpenedEveryDay,
        amenities: [],
        priceRange: .Budget,
        averageRating: getAverageRating(ratingArray: mockedCoffeeShopRatings),
        totalNumberOfRatings: getTotalNumberOfRatings(ratingArray: mockedCoffeeShopRatings))

let mockedCoffeeShopList : [CoffeeShopModel] = [mockedCoffeeShop_1, mockedCoffeeShop_2, mockedCoffeeShop_3]


