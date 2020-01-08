//
//  LocationRow.swift
//  Locations
//
//  Created by Harshit Ruwali on 08/01/20.
//  Copyright © 2020 Harshit Ruwali. All rights reserved.
//

import SwiftUI

struct LocationRow: View {
    var Location: Location

    var body: some View {
        HStack {
            Location.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(verbatim: Location.name)
            Spacer()
            
            if Location.isVisited {
                Image(systemName: "flag.fill")
                    .imageScale(.medium)
                    .foregroundColor(.red)
            }
        }
    }
}

struct LocationRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LocationRow(Location: LocationData[0])
                .previewLayout(.fixed(width: 300, height: 70))
            LocationRow(Location: LocationData[1])
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
