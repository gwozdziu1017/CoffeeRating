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

func getCoffeeShopToDisplay(id: UUID) -> CoffeeShopModel? {
    return mockedCoffeeShopList.first(where: { $0.id == id })
}

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
            
            Annotation (
                mockedCoffeeShop_1.name,
                coordinate: coffeeShopCoordinate_1,
                anchor: .bottom) {
                    Image(systemName: "mug.fill")
                        .onTapGesture {
                            self.coffeeShopToDisplay = getCoffeeShopToDisplay(id: mockedCoffeeShop_1.id)
                            self.showDetails.toggle()
                        }
                }
            Annotation (
                mockedCoffeeShop_3.name,
                coordinate: coffeeShopCoordinate_3,
                anchor: .bottom) {
                    Image(systemName: "mug.fill")
                        .onTapGesture {
                            self.coffeeShopToDisplay = getCoffeeShopToDisplay(id: mockedCoffeeShop_3.id)
                            self.showDetails.toggle()
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
