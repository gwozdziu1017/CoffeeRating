//
//  MapView.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 25/06/2025.
//

import SwiftUI
import MapKit


struct MapView: View {
    var locationManager = CLLocationManager()
    @State var showDetails = false
    @State var cameraPosition: MapCameraPosition =
        .region(
            .init(
                center: CLLocationCoordinate2D(latitude: 51.7499, longitude: 19.3333),
                latitudinalMeters: 1300,
                longitudinalMeters: 1300)
        )

    var body: some View {
        Map(initialPosition: cameraPosition) {
            Annotation(mockedCoffeeShop_1.name, coordinate: coffeeShopCoordinate_1, anchor: .bottom) {
                Image(systemName: "mug.fill")
                    .onTapGesture {
                        self.showDetails.toggle()
                    }
            }
            Annotation(mockedCoffeeShop_2.name, coordinate: coffeeShopCoordinate_2, anchor: .bottom) {
                Image(systemName: "mug.fill")
            }
            UserAnnotation()
        }
        //        .onAppear { // add "use localization" in project settings
        //            locationManager.requestWhenInUseAuthorization()
        //        }
            .mapControls {
                MapUserLocationButton()
                MapCompass()
                MapPitchToggle()
                MapScaleView()
            }
            .mapStyle (
                .standard (
                    elevation: .realistic))
        self.showDetails ? AnyView(getCoffeeShopDetailsView(coffeeShop: mockedCoffeeShop_1)) : AnyView(EmptyView())
    }
}

var tempView_1 : some View {
    VStack {
        Text("whatcha gonna do")
    }
}

var tempView_2 : some View {
    Text("2222")
}

#Preview {
    MapView()
}

