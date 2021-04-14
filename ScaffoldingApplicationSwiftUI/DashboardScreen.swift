//
//  DashboardScreen.swift
//  ScaffoldingApplicationSwiftUI
//
//  Created by Dmitrii on 14.04.2021.
//

import SwiftUI

struct DashboardScreen: View {
    @State private var activateLinkVesuvio:Bool = false
    var body: some View {
        NavigationView {
        NavigationLink(destination: TravelView(emoji: "🌋"), isActive: $activateLinkVesuvio) {
            Button("Open Vesuvio") {
                self.activateLinkVesuvio = true
            }
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(5)
            }
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
