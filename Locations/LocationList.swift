//
//  LocationList.swift
//  Locations
//
//  Created by Harshit Ruwali on 08/01/20.
//  Copyright © 2020 Harshit Ruwali. All rights reserved.
//

import SwiftUI

struct LocationList: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showVisitedOnly){
                    Text("Visited")
                }
                
                ForEach(userData.Location) { Location in
                    if !self.userData.showVisitedsOnly || Location.isVisited {
                        NavigationLink(
                            destination: LocationDetail(Location: Location)
                                .environmentObject(self.userData)
                        ) {
                            LocationRow(Location: Location)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Locations"))
        }
    }
}

struct LocationsList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LocationList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}
