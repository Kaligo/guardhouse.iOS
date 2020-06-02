//
//  SwiftUIView.swift
//  guardhouse.iOS
//
//  Created by Melvrick Goh on 1/6/20.
//  Copyright © 2020 AscendaLoyalty. All rights reserved.
//

import SwiftUI

struct LoginRow: View {
    var login: TenantLogin

    var body: some View {
        HStack {
            login.image
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: ContentMode.fill)
            Text(login.tenantId + " - " + login.environment)
            Spacer()
        }
    }
}

struct LoginRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginRow(login: loginData[0])
            LoginRow(login: loginData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
