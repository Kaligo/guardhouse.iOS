//
//  SwiftUIView.swift
//  guardhouse.iOS
//
//  Created by Melvrick Goh on 1/6/20.
//  Copyright © 2020 AscendaLoyalty. All rights reserved.
//
/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

struct TenantLogin: Hashable, Codable, Identifiable {
    var id: Int
    var tenantId: String
    var environment: String
    fileprivate var imageName: String
    fileprivate var imageExt: String
    var loginUrl: String
}

extension TenantLogin {
    var image: Image {
        ImageStore.shared.image(name: imageName, ext: imageExt)
    }
}
