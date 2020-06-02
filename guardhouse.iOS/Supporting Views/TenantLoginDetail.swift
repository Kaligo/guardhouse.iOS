//
//  File.swift
//  guardhouse.iOS
//
//  Created by Melvrick Goh on 2/6/20.
//  Copyright © 2020 AscendaLoyalty. All rights reserved.
//

import SwiftUI

struct TenantLoginDetail : View {
    var login: TenantLogin
    @ObservedObject var viewModel = ViewModel()
    @State var showLoader = false
    @State var message = ""
    @State var webTitle = ""
    
    // For WebView's forward and backward navigation
    var webViewNavigationBar: some View {
        VStack(spacing: 0) {
            Divider()
            HStack {
                Spacer()
                Button(action: {
                    self.viewModel.webViewNavigationPublisher.send(.backward)
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .regular))
                        .imageScale(.large)
                        .foregroundColor(.gray)
                }
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                }
                Button(action: {
                    self.viewModel.webViewNavigationPublisher.send(.forward)
                }) {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 20, weight: .regular))
                        .imageScale(.large)
                        .foregroundColor(.gray)
                }
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                }
                Button(action: {
                    self.viewModel.webViewNavigationPublisher.send(.reload)
                }) {
                    Image(systemName: "arrow.clockwise")
                        .font(.system(size: 20, weight: .regular))
                        .imageScale(.large)
                        .foregroundColor(.gray).padding(.bottom, 4)
                }
                Spacer()
            }.frame(height: 45)
            Divider()
        }
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Text(webTitle).font(.subheadline).onReceive(self.viewModel.showWebTitle.receive(on: RunLoop.main)) { value in
                    self.webTitle = "Web title: \(value)"
                }
                Text("env: \(login.tenantId), \(login.environment)").font(.subheadline)

                WebView(url: login.loginUrl, viewModel: viewModel).overlay (
                    RoundedRectangle(cornerRadius: 4, style: .circular)
                        .stroke(Color.gray, lineWidth: 0.5)
                )
                
                webViewNavigationBar
            }.onReceive(self.viewModel.showLoader.receive(on: RunLoop.main)) { value in
                self.showLoader = value
            }
            
            // A simple loader that is shown when WebView is loading any page and hides when loading is finished.
            if showLoader {
                Loader()
            }
        }
    }
}

struct TenantLoginDetail_Previews: PreviewProvider {
    static var previews: some View {
        TenantLoginDetail(login: loginData[0])
    }
}
