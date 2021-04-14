//
//  TravelScreen.swift
//  ScaffoldingApplicationSwiftUI
//
//  Created by Dmitrii on 10.04.2021.
//

import SwiftUI
import Combine

final class TravelViewModel: ObservableObject {
    @Published private(set) var travels = [
    Travel(name: "Mountains", emoji: "⛰", isFave: false),
    Travel(name: "Beaches", emoji: "🏖", isFave: false),
    Travel(name: "Ugly monuments", emoji: "🗿", isFave: false),
    Travel(name: "Vesuvio", emoji: "🌋", isFave: true),
    Travel(name: "Bridges", emoji: "🌉", isFave: false)
    ]
}

struct Travel {
    let name:String
    let emoji:String
    let isFave:Bool
}

extension Travel: Identifiable {
    var id:String {
        name
    }
}

struct TravelScreen: View {
    @ObservedObject var viewModel: TravelViewModel = .init()
    @State var isFavesShowed: Bool = false
    var body: some View {
        NavigationView {
            List {
            FilterView(favesShowed: $isFavesShowed)
            ForEach(viewModel.travels) { item in
                if !isFavesShowed || item.isFave {
                    TravelListCell(travel: item)
                }
             }
           }
            .navigationTitle(Text("Travels")).font(.subheadline)
        }
    }
}

struct TravelListCell: View {
    let travel:Travel
    var body: some View {
        NavigationLink(destination: TravelView(emoji: travel.emoji)) {
            Text(travel.name)
        }
    }
}

struct TravelView: View {
    let emoji:String
    var body: some View {
        Text(emoji)
            .font(Font.system(size: 199))
    }
}

struct FilterView: View {
    @Binding var favesShowed: Bool
    var body: some View {
        Toggle(isOn: $favesShowed) {
            Text("Favorites")
        }
    }
}

struct TravelScreen_Previews: PreviewProvider {
    static var previews: some View {
        TravelScreen()
    }
}
