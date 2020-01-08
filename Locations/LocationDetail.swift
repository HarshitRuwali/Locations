//
//  LocationDetail.swift
//  Locations
//
//  Created by Harshit Ruwali on 08/01/20.
//  Copyright © 2020 Harshit Ruwali. All rights reserved.
//

import SwiftUI

struct LocationDetail: View {
    @EnvironmentObject var userData: UserData
    var Location: Location
    
    var LocationIndex: Int {
        userData.Location.firstIndex(where: { $0.id == Location.id })!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: Location.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: Location.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(verbatim: Location.name)
                        .font(.title)
                    
                    Button(action: {
                        self.userData.Location[self.LocationIndex]
                            .isVisited.toggle()
                    }) {
                        if self.userData.Location[self.LocationIndex]
                            .isVisited {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                
            }
            .padding()
            
            Spacer()
        }
    }
}

struct LocationDetail_Preview: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return LocationDetail(Location: userData.Location[0])
            .environmentObject(userData)
    }
}
