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
    var mapService = MapService()
    var body: some View {
        mapService.getMap()
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
        mapService.chengeView ? AnyView(tempView_1) : AnyView(EmptyView())
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

