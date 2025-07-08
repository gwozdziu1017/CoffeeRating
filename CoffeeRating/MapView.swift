//
//  MapView.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 25/06/2025.
//

import SwiftUI
import MapKit


struct MapView: View {
    @StateObject private var mapService = MapService()

    func getCoffeeShopDetailedView() -> some View {
            getCoffeeShopDetailsView(coffeeShop: mapService.coffeeShopToDisplay!)
    }

    var body: some View {
        mapService.getMap()
        mapService.showDetails ? AnyView(getCoffeeShopDetailedView()) : AnyView(EmptyView())
    }
}

#Preview {
    MapView()
}

