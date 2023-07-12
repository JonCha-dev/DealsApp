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
            ZStack(alignment: .topLeading) {
                List {
                    ForEach(searchResults) { deal in
                            DealCell(deal:deal)
                            .background(NavigationLink("", destination: DealView(deal:deal)).opacity(0))
                            .listRowBackground(Color("AmazonGray"))
                    }
                }
                .navigationTitle("Deals")
                
                Rectangle()
                    .fill(Color("AmazonDBlue"))
                    .frame(height:100)
                    .ignoresSafeArea(.all)
            }
            .background(Color("AmazonGray"))
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


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel:HomeViewModel(), searchText:"")
    }
}

