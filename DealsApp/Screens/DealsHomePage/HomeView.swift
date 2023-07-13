//
//  ContentView.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import SwiftUI

struct HomeView: View {
    @State private var path = NavigationPath()
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack(path: $path) {
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
                    SearchView(viewModel:viewModel, path: $path)
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
                Spacer()
                ScrollView {
                    VStack {
                        Text("Recommended Deals")
                            .font(.system(size:30))
                            .foregroundColor(Color("AmazonDBlue"))
                            .bold()
                        
                        switch viewModel.status {
                        case .initial, .loading:
                            Text("Loading...")
                        case .loaded:
                            recommendListView(viewModel.data)
                        case .error:
                            Text("Error")
                        }
                    }
                    .padding([.top])
                }
            }
            .background(Color("AmazonGray"))
            .buttonStyle(PlainButtonStyle())
            .navigationDestination(for: Deal.self) { deal in
                DealView(deal: deal, viewModel: viewModel, path: $path)
            }
        }
        .onAppear {
            viewModel.getDeals()
            UINavigationBar.appearance().barTintColor = UIColor(Color("AmazonDBlue"))
        }
    }
    
    private func recommendListView(_ deals: [Deal]) -> some View {
        ForEach(0 ..< 15 ) { i in
            NavigationLink(value: deals[i]) {
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
