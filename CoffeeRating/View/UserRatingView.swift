//
//  UserRatingView.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 10/07/2025.
//
import SwiftUI

struct UserRatingView: View {
    var userRating = UserRatingModel()
    
    var body: some View {
        VStack {
            getUserRateView(userRating: userRating)
            getPriceRangeView(userRating: userRating)
        }
    }
}

#Preview {
    UserRatingView()
}
