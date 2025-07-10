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

let initialCameraPositionLatitude: Double = 51.7499
let initialCameraPositionLongitude: Double = 19.3333
let initialCameraPositionLatidiunalMeters: Double = 1300
let initialCameraPositionLongitudinalMeters: Double = 1300

class MapService: ObservableObject {
    @Published var showDetails: Bool = false
    @Published var coffeeShopToDisplay: CoffeeShopModel?

    var locationManager = CLLocationManager()
    var cameraPosition: MapCameraPosition =
        .region(
            .init(
                center: CLLocationCoordinate2D(
                    latitude: initialCameraPositionLatitude,
                    longitude: initialCameraPositionLongitude),
                latitudinalMeters: initialCameraPositionLatidiunalMeters,
                longitudinalMeters: initialCameraPositionLongitudinalMeters)
        )

    func getMap() -> some View {
        Map(initialPosition: cameraPosition) {
            ForEach(mockedCoffeeShopList) { shop in
                Annotation (
                    shop.name,
                    coordinate: CLLocationCoordinate2D(latitude: shop.latitude, longitude: shop.longitude),
                    anchor: .bottom) {
                        Image(systemName: "mug.fill")
                            .onTapGesture {
                                self.coffeeShopToDisplay = shop
                                self.showDetails.toggle()
                            }
                    }
            }
        }
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            MapPitchToggle()
            MapScaleView()
        }
        .mapStyle (
            .standard (
                elevation: .realistic))
    }
}
