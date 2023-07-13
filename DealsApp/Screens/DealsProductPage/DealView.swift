//
//  DealView.swift
//  DealsApp
//
//  Created by Jon Chang on 7/6/23.
//

import SwiftUI

struct DealView: View {
    let deal:Deal
    @ObservedObject var viewModel:HomeViewModel
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                VStack(alignment: .leading, spacing:10) {
                    AsyncImage(url: URL(string: deal.product.image)) { image in
                        image
                            .resizable()
                            .frame(width: 400, height: 400)
                            .aspectRatio(contentMode:.fit)
                            .cornerRadius(10)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 400, height: 400)
                            .aspectRatio(contentMode:.fit)
                            .cornerRadius(10)
                    }
                    
                    dealTitleView(deal)
                    dealDescView(deal)
                    
                    Text("Comments:")
                        .font(.system(size: 25))
                        .bold()
                        .padding([.leading])
                    commentListView(deal.comments)
                        .frame(maxWidth:.infinity)
                    
                    Text("Users also liked:")
                        .font(.system(size:25))
                        .bold()
                        .padding([.top, .leading])
                
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            likeListView(deal, viewModel.data)
                        }
                    }
                    .padding([.leading])
                    
                    HStack {
                        Spacer()
                        Button {
                            path.removeLast(path.count)
                        } label: {
                            Text("Back to homepage.")
                                .font(.system(size:20))
                                .foregroundColor(Color("AmazonOrange"))
                        }
                        Spacer()
                    }
                    
                    
                }
                .foregroundColor(Color("AmazonDBlue"))
            }
            
            Rectangle()
                .fill(Color("AmazonDBlue"))
                .frame(height:100)
                .ignoresSafeArea(.all)
        }
        .background(Color("AmazonGray"))
    }
    
    var divider: some View = Color.black.frame(height: 5 / UIScreen.main.scale)
        .padding([.top, .bottom], 40)
    
    private func dealTitleView(_ deal: Deal) -> some View {
        VStack(alignment: .leading) {
            Text("\(deal.title) (\(deal.product.availability))")
                .bold()
                .font(.system(size: 30))
                .padding([.leading, .trailing, .bottom])
            Text("Sale Price: $" + String(format: "%.2f", Float(deal.price)/100))
                .bold()
                .font(.system(size:45))
                .padding([.leading])
            
            divider
        }
    }
    
    private func dealDescView(_ deal: Deal) -> some View {
        VStack(alignment: .leading) {
            Text("Description:")
                .font(.system(size: 25))
                .bold()
                .padding([.leading])
            Text(deal.product.description)
                .italic()
                .padding([.leading, .trailing])
            
            divider
        }
    }
    
    private func commentListView(_ comments: [Comment]) -> some View {
        ForEach(comments) { comment in
            HStack(spacing: 10) {
                Text(comment.user.name)
                    .font(.system(size: 15))
                    .frame(width:75)
                    .padding([.leading])
                Color.black.frame(width: 5 / UIScreen.main.scale)
                Text(comment.text)
                    .frame(width:250)
                Spacer()
            }
            .padding([.top, .bottom], 10)
            .foregroundColor(Color("AmazonDBlue"))
            .border(Color.black)
        }
    }
    
    private func likeListView(_ deal: Deal, _ deals: [Deal]) -> some View {
        ForEach((deal.likes).filter{ $0.id != deal.id } ) { like in
            Button {
                path.append(deals[Int(like.id)! - 1])
            } label: {
                DealCell(deal: deals[Int(like.id)! - 1] )
            }
        }
    }
}

/*
struct DealView_Previews: PreviewProvider {
    static var previews: some View {
        DealView(deal:mock.data, viewModel: HomeViewModel())
    }
}
*/
