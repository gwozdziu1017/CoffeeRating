//
//  MapView.swift
//  CoffeeRating
//
//  Created by Damian Gwóźdź on 25/06/2025.
//

import SwiftUI
import MapKit


struct MapView: View {
    @State private var chengeView = false
    @State var cameraPosition: MapCameraPosition =
        .region(
            .init(
                center: CLLocationCoordinate2D(latitude: 51.7499, longitude: 19.3333),
                latitudinalMeters: 1300,
                longitudinalMeters: 1300)
        )
    var locationManager = CLLocationManager()
    var body: some View {
        Map(initialPosition: cameraPosition) {
            Annotation("Temp location", coordinate: .temp, anchor: .bottom) {
                Image(systemName: "location.fill")
                    .onTapGesture {
                        self.chengeView = true
                    }
            }
            UserAnnotation()
        }
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
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
        chengeView ? AnyView(tempView_1) : AnyView(EmptyView())
    }
}

extension CLLocationCoordinate2D {
    static let temp = CLLocationCoordinate2D(
        latitude: 51.7499,
        longitude: 19.3333
    )
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

