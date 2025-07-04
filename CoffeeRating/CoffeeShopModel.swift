//
//  CoffeeShopModel.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 27/06/2025.
//
import Foundation
import MapKit

enum Amenity: String, CaseIterable, Codable {
    case wifi
    case parking
    case takeaway
    case outdoorSeating
    case petFriendly

    var imageName: String {
        switch self {
        case .wifi: return "wifi"
        case .parking: return "parkingsign"
        case .takeaway: return "takeoutbag.and.cup.and.straw"
        case .outdoorSeating: return "sun.horizon"
        case .petFriendly: return "pawprint"
        }
    }
}

extension Amenity: Identifiable {
    var id: String { self.rawValue }
}

enum PriceRange: Int, Codable {
    case budget = 1
    case moderate = 2
    case expensive = 3
    case premium = 4
}

struct DaySchedule: Codable, Identifiable {
    var id: String{
        self.dayOfTheWeek
    }
    let dayOfTheWeek : String
    let openingTime : String
    let closingTime : String
}

extension DaySchedule {
    func print() -> String {
        "Day: \(dayOfTheWeek), Opening: \(openingTime), Closing: \(closingTime)"
    }
}

class CoffeeShopModel: Identifiable, Codable {
    let id: UUID
    let name: String
    let address: String
    let latitude: Double
    let longitude: Double
    let coordinate: CLLocationCoordinate2D
    let phoneNumber: String
    let openingHours: [DaySchedule]
    let isOpenNow: Bool
    var amenities: [Amenity]
    let priceRange: PriceRange

    var averageRating: Double
    var totalNumberOfRatings: Int

    enum CodingKeys : String, CodingKey {
        case name
        case address
        case latitude
        case longitude
        case phoneNumber
        case isOpenNow
        case openingHours
        case amenities
        case priceRange
        case averageRating
        case totalNumberOfRatings
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        name = try container.decode(String.self, forKey: .name)
        address = try container.decode(String.self, forKey: .address)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.coordinate = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        self.isOpenNow = try container.decode(Bool.self, forKey: .isOpenNow)
        openingHours = try container.decode([DaySchedule].self, forKey: .openingHours)
        amenities = try container.decode([Amenity].self, forKey: .amenities)
        priceRange = try container.decode(PriceRange.self, forKey: .priceRange)
        averageRating = try container.decode(Double.self, forKey: .averageRating)
        totalNumberOfRatings = try container.decode(Int.self, forKey: .totalNumberOfRatings)
    }

    init(
        name: String,
        address: String,
        latitude: Double,
        longitude: Double,
        phoneNumber: String,
        isOpenNow: Bool,
        openingHours: [DaySchedule],
        amenities: [Amenity],
        priceRange: PriceRange,
        averageRating: Double,
        totalNumberOfRatings: Int) {
            self.id = UUID()
            self.name = name
            self.address = address
            self.latitude = latitude
            self.longitude = longitude
            self.coordinate = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
            self.phoneNumber = phoneNumber
            self.isOpenNow = isOpenNow
            self.openingHours = openingHours
            self.amenities = amenities
            self.priceRange = priceRange
            self.averageRating = averageRating
            self.totalNumberOfRatings = totalNumberOfRatings
        }
}
