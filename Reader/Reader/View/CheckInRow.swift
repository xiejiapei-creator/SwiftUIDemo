//
//  CheckInRow.swift
//  Reader
//
//  Created by 谢佳培 on 2021/3/3.
//

import SwiftUI
import MapKit
import CoreLocation

struct CheckInRow: View
{
    @State var region: MKCoordinateRegion
    @ObservedObject var locationManager: LocationManager
    var date: String
    @State var city: String = ""
    @State var postal: String = ""
    @State var address: String = ""
    @Binding var displayMode: Int

    var body: some View
    {
        HStack
        {
            Map(coordinateRegion: $region)
                .frame(width: 100, height: 100)
                .cornerRadius(300)
                .padding(.trailing, 10)
            
            VStack
            {
                Text(city)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Group
                {
                    HStack
                    {
                        Image(systemName: "clock")
                        Text(date)
                            .font(.body)
                    }
                    
                    if displayMode == 1
                    {
                        HStack
                        {
                            Image(systemName: "pin")
                            Text(address)
                                .font(.body)
                        }
                        HStack
                        {
                            Image(systemName: "signpost.right")
                            Text(postal)
                                .font(.body)
                        }
                    }
                }
                .foregroundColor(.orange)
            }
            
            Spacer()
        }
        .padding()
        .onAppear
        {
            locationManager.lookUpCurrentLocation(location: CLLocation(latitude: region.center.latitude, longitude: region.center.longitude), completionHandler: { placemark in
                city = (placemark?.locality) ?? ""
                postal = (placemark?.postalCode) ?? ""
                address = (placemark?.name) ?? ""
            })
        }
    }
}
