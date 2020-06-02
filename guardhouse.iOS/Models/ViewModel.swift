//
//  ViewModel.swift
//  guardhouse.iOS
//
//  Created by Melvrick Goh on 1/6/20.
//  Copyright © 2020 AscendaLoyalty. All rights reserved.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    var webViewNavigationPublisher = PassthroughSubject<WebViewNavigation, Never>()
    var showWebTitle = PassthroughSubject<String, Never>()
    var showLoader = PassthroughSubject<Bool, Never>()
    var valuePublisher = PassthroughSubject<String, Never>()
}

enum WebViewNavigation {
    case backward, forward, reload
}

enum WebUrlType {
    case localUrl, publicUrl
}
