//
//  RoutesButton.swift
//  lumiar-fortaleza
//
//  Created by User on 27/04/26.
//

import SwiftUI
import MapKit

struct DistanceInfoView: View {
    //    @Published var locationStatus: CLAuthorizationStatus?
    //    @Published var lastLocation: CLLocation?
    var location: Location
    var userCoordinates: CLLocation? {
        return CLLocationManager().location
    }
    
    var locationCoordinates: CLLocation {
        return CLLocation(latitude: location.latitude, longitude: location.longitude)
    }
    
    var userDistance: String {
        guard let userLoc = userCoordinates else {
            return "--"
        }
        
        let distanceInMeters = userLoc.distance(from: locationCoordinates)
        let distanceInKm = distanceInMeters / 1000
        
        return String(format: "%.1fkm", distanceInKm)
    }
    
    var body: some View {
        VStack{
            Text("Distância")
            Label {
                Text(userDistance)
            } icon: {
                Image(systemName: "point.topleft.down.to.point.bottomright.curvepath.fill")
            }
            
        }
        .padding(5)
        .frame(maxWidth: .infinity, alignment: .center)
        .cornerRadius(10)
        
    }
}
//private func GetDistanceView(distance: Double) -> some View {
//
//            HStack(spacing: 10) {
//
//                    Label(return distance //Here the final distance should be displayed, i.e 36,4 km
//            }
//        }
//func distanceInKM(latitude: Int, longitude: Int) -> Double { //Here's the method I made to calculate an actual distance
//
//        let houseCoordinates = CLLocation(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
//
//        let userCoordinates = CLLocation(latitude: lastLocation?.coordinate.latitude ?? 50, longitude: lastLocation?.coordinate.longitude ?? 30)
//        let distance = userCoordinates.distance(from: houseCoordinates) / 1000 //.distance comes in meters so /1000 is to have a KM value
//
//        let s = String(format: "%.0f", distance)
//
//        return Double(s + "Km") ?? 35.5 // This value of 35.5 as placeholder is constantly displayed instead of the actual value
//    }
