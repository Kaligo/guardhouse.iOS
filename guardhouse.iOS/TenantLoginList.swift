//
//  ContentView.swift
//  guardhouse.iOS
//
//  Created by Melvrick Goh on 1/6/20.
//  Copyright © 2020 AscendaLoyalty. All rights reserved.
//
import SwiftUI
import WebKit

struct TenantLoginList: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List(loginData) { login in
//                NavigationLink(destination: WebView(urlType: login.loginUrl, viewModel: viewModel)) {
                NavigationLink(destination: TenantLoginDetail(login: login)) {
                    LoginRow(login: login)
                }
            }
            .navigationBarTitle(Text("Guardhouse Logins"))
        }
    }
}

struct TenantLoginList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            TenantLoginList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
