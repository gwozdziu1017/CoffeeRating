//
//  CoffeeShopService.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 27/06/2025.
//
import Foundation

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
