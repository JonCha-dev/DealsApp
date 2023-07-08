//
//  ContentView.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: -40) {
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .fill(Color(red:0.235, green:0.31, blue:0.463))
                        .frame(height:200)
                        .ignoresSafeArea(.all)
                    Text("Some Deals App")
                        .font(.system(size:35))
                        .foregroundColor(Color(red:0.867, green:0.859, blue:0.945))
                        .bold()
                        .offset(x: 10)
                }
                NavigationLink {
                    SearchView(viewModel:viewModel)
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                        Text("Search for deals")
                            .foregroundStyle(Color(red:0.22, green:0.247, blue: 0.318))
                    }
                    .offset(x:-90)
                    .padding(.horizontal, 100)
                    .padding(.vertical, 15)
                    .background(Color(red:0.867, green:0.859, blue:0.945))
                    .cornerRadius(15)
                }
                .offset(y:-95)
                ScrollView {
                    Text("Recommended Deals")
                        .font(.system(size:30))
                        .foregroundColor(Color(red:0.22, green:0.247, blue: 0.318))
                        .bold()
                    recommendListView(viewModel.data)
                }
                Spacer()
            }
            .background(Color(red:0.82, green:0.745, blue:0.69))
            .buttonStyle(PlainButtonStyle())
        }
        .onAppear {
            viewModel.getDeals()
        }
    }
    
    private func recommendListView(_ deals: [Deal]) -> some View {
        ForEach(0..<10) {i in
            NavigationLink {
                DealView(deal: deals[i])
            } label: {
                DealCell(deal: deals[i])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
