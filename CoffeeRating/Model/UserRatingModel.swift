//
//  UserRatingModel.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 27/06/2025.
//
import Foundation

class UserRatingModel: Identifiable, Decodable {
    let id: UUID
    let rateId: Int
    let userId: Int
    let coffeeShopId: Int
    let createdAt: Date

    var updatedAt: Date?
    var rate: Int?
    var amenities: [Amenity]?
    var priceRange: PriceRange?
    
    enum CodingKeys: String, CodingKey {
        case rateId
        case userId
        case coffeeShopId
        case createdAt
        case updatedAt
        case rate
        case amenities
        case priceRange
    }

    required init(from decoder: Decoder) throws {
        id = UUID()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rateId = try container.decode(Int.self, forKey: .rateId)
        userId = try container.decode(Int.self, forKey: .userId)
        coffeeShopId = try container.decode(Int.self, forKey: .coffeeShopId)
        createdAt = try container.decode(Date.self, forKey: .createdAt)
        updatedAt = try container.decodeIfPresent(Date.self, forKey: .updatedAt)
        rate = try container.decode(Int.self, forKey: .rate)
        amenities = try container.decodeIfPresent([Amenity].self, forKey: .amenities)
        priceRange = try container.decodeIfPresent(PriceRange.self, forKey: .priceRange)
    }
    
    init() {
        id = UUID()
        rateId = 0
        userId = 0
        coffeeShopId = 0
        rate = 0
        createdAt = Date()
        updatedAt = nil
    }

    func setUpdatedAt(date: Date) {
        self.updatedAt = date
    }
    func getUpdatedAt() -> Date? {
        return updatedAt
    }
    func setRate(rate: Int) {
        self.rate = rate
    }
    func getRate() -> Int? {
        return rate
    }
    func setAmenities(amenities: [Amenity]) {
        self.amenities = amenities
    }
    func getAmenities() -> [Amenity]? {
        return amenities
    }
    func setPriceRange(priceRange: PriceRange) {
        self.priceRange = priceRange
    }
    func getPriceRange() -> PriceRange? {
        return priceRange
    }
}
