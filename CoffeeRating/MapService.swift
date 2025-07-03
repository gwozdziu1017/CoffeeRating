//
//  MapService.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 27/06/2025.
//
import SwiftUI
import MapKit

// fetch nearby coffee places coordinates
// show place details

struct MapService {
    @State var chengeView = false
    @State var cameraPosition: MapCameraPosition =
        .region(
            .init(
                center: CLLocationCoordinate2D(latitude: 51.7499, longitude: 19.3333),
                latitudinalMeters: 1300,
                longitudinalMeters: 1300)
        )
    
    func getMap() -> Map<some View> {
        Map(initialPosition: cameraPosition) {
            Annotation(mockedCoffeeShop_1.name, coordinate: coffeeShopCoordinate_1, anchor: .bottom) {
                Image(systemName: "mug.fill")
            }
            Annotation(mockedCoffeeShop_2.name, coordinate: coffeeShopCoordinate_2, anchor: .bottom) {
                Image(systemName: "mug.fill")
            }
            UserAnnotation()
        }
    }
}

