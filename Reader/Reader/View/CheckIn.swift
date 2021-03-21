//
//  CheckIn.swift
//  Reader
//
//  Created by 谢佳培 on 2021/3/3.
//

import SwiftUI
import MapKit

struct CheckIn: View
{
    let cloudStorage = NSUbiquitousKeyValueStore()
    
    @State var displayMode = 0
    
    @StateObject var locationManager = LocationManager()
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Entity.timestamp, ascending: false)], animation: .default)
    var checkIns: FetchedResults<Entity>
    
    var body: some View
    {
        VStack
        {
            NavigationView
            {
                List
                {
                    IAP()
                    
                    Picker(selection: $displayMode, label: Text("显示模式")) {
                        Text("精简").tag(0)
                        Text("详细").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onChange(of: displayMode)
                    { latestSelection in
                        cloudStorage.set(latestSelection, forKey: "displayMode")
                    }
                    
                    ForEach(checkIns)
                    { checkIn in
                        CheckInRow(region: MKCoordinateRegion(
                            center: CLLocationCoordinate2D(
                                latitude: checkIn.latitude,
                                longitude: checkIn.longitude
                            ),
                            span: MKCoordinateSpan(
                                latitudeDelta: 0.1,
                                longitudeDelta: 0.1
                            )
                        ), locationManager: locationManager, date: displayDate(checkIn.timestamp!), displayMode: $displayMode)
                    }
                    .onDelete(perform: deleteCheckIn)
                }
                .navigationTitle("签到")
                .toolbar
                {
                    Button(action: {
                        Vibration.selection.vibrate()
                        newCheckIn()
                    }, label: {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(.headline, design: .rounded))
                    })
                }
            }
        }
        .onAppear
        {
            displayMode = Int(cloudStorage.double(forKey: "displayMode"))
        }
    }
    
    func newCheckIn()
    {
        let new = Entity(context: viewContext)
        new.timestamp = Date()
        new.longitude = locationManager.region.center.longitude
        new.longitude = locationManager.region.center.latitude
        try? viewContext.save()
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "zh_Hans")
        formatter.setLocalizedDateFormatFromTemplate("MMMMdd")
        return formatter
    }()
    
    func displayDate(_ date: Date) -> String
    {
        return dateFormatter.string(from: date)
    }
    
    func deleteCheckIn(offsets: IndexSet)
    {
        offsets.map { checkIns[$0] }.forEach(viewContext.delete)
        try? viewContext.save()
    }
}

struct CheckIn_Previews: PreviewProvider
{
    static var previews: some View
    {
        CheckIn()
    }
}








