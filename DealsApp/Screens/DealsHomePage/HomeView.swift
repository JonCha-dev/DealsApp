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
                        .fill(Color("AmazonDBlue"))
                        .frame(height:200)
                        .ignoresSafeArea(.all)
                    Text("Some Deals App")
                        .font(.system(size:35))
                        .foregroundColor(Color("AmazonGray"))
                        .bold()
                        .offset(x: 10)
                }
                NavigationLink {
                    SearchView(viewModel:viewModel)
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                        Text("Search for deals")
                            .foregroundStyle(Color("AmazonDBlue"))
                    }
                    .offset(x:-90)
                    .padding(.horizontal, 100)
                    .padding(.vertical, 15)
                    .background(Color("AmazonGray"))
                    .cornerRadius(15)
                }
                .offset(y:-95)
                ScrollView {
                    Text("Recommended Deals")
                        .font(.system(size:30))
                        .foregroundColor(Color("AmazonDBlue"))
                        .bold()
                    recommendListView(viewModel.data)
                }
                Spacer()
            }
            .background(Color("AmazonGray"))
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
