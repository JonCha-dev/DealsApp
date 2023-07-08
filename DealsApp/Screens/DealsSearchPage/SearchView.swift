//
//  SearchView.swift
//  DealsApp
//
//  Created by Jon Chang on 7/5/23.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel:HomeViewModel
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(searchResults) { deal in
                        NavigationLink {
                            DealView(deal:deal)
                        } label: {
                            DealCell(deal:deal)
                        }
                        .listRowBackground(Color(red:0.671, green:0.624, blue:0.616))
                    }
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Deals")
            }
            .background(Color(red:0.82, green:0.745, blue:0.69))
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Search for a product")
    }
    
    var searchResults: [Deal] {
        if searchText.isEmpty {
            return []
        } else {
            return viewModel.data.filter { $0.title.contains(searchText) }
        }
    }
}

/*
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
*/
