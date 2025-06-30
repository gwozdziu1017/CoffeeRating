//
//  UserRatingModel.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 27/06/2025.
//
import Foundation

class RatingModel: Identifiable, Codable {
    let id: UUID
    let rateId: Int
    let userId: Int
    let coffeeShopId: Int
    var rating: Int
    let createdAt: Date
    var updatedAt: Date?

    enum CodingKeys: String, CodingKey {
        case rateId
        case userId
        case coffeeShopId
        case rating
        case createdAt
        case updatedAt
    }

    required init(from decoder: Decoder) throws {
        id = UUID()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rateId = try container.decode(Int.self, forKey: .rateId)
        userId = try container.decode(Int.self, forKey: .userId)
        coffeeShopId = try container.decode(Int.self, forKey: .coffeeShopId)
        rating = try container.decode(Int.self, forKey: .rating)
        createdAt = try container.decode(Date.self, forKey: .createdAt)
        updatedAt = try container.decodeIfPresent(Date.self, forKey: .updatedAt)
    }
}
