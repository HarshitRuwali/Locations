//
//  UserData.swift
//  Locations
//
//  Created by Harshit Ruwali on 08/01/20.
//  Copyright © 2020 Harshit Ruwali. All rights reserved.
//

import SwiftUI

import Combine

final class UserData: ObservableObject{
    @Published var showVisitedOnly = false
    @Published var Location = LocationData
    @Published var showToVistOnly = false
}
