//
//  ContentView.swift
//  ScaffoldingApplicationSwiftUI
//
//  Created by Dmitrii on 10.04.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    var body: some View {
        TabView(selection: $selection) {
            DashboardScreen()
                .tabItem {
                    VStack {
                        Text("Main")
                        Image(systemName: "star")
                            .font(Font.title.weight(.heavy))
                    }
                }
                .tag(0)
            TravelScreen()
                .tabItem {
                    HStack {
                        Text("Travels")
                        Divider()
                        VStack {
                            Image(systemName: "airplane")
                            Text("2")
                        }
                    }
                }
                .tag(1)
            AboutScreen()
                .tabItem {
                    Text("About")
                    Image(systemName: "graduationcap")
                        .font(Font.footnote.weight(.ultraLight))
                }
                .tag(2)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
