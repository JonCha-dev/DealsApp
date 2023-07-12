//
//  DealView.swift
//  DealsApp
//
//  Created by Jon Chang on 7/6/23.
//

import SwiftUI

struct DealView: View {
    @State var deal:Deal
    
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
                    Text("\(deal.title) (\(deal.product.availability))")
                        .bold()
                        .font(.system(size: 30))
                        .padding([.leading, .trailing, .bottom])
                    Text("Sale Price: $" + String(format: "%.2f", Float(deal.price)/100))
                        .bold()
                        .font(.system(size:45))
                        .padding([.leading])
                    
                    Color.black.frame(height: 5 / UIScreen.main.scale)
                        .padding([.top, .bottom], 40)
                    
                    Text("Description:")
                        .font(.system(size: 25))
                        .bold()
                        .padding([.leading])
                    Text(deal.product.description)
                        .italic()
                        .padding([.leading, .trailing])
                    
                    Color.black.frame(height: 5 / UIScreen.main.scale)
                        .padding([.top, .bottom], 40)
                    
                    Text("Comments:")
                        .font(.system(size: 25))
                        .bold()
                        .padding([.leading])
                    commentListView(deal.comments)
                        .frame(maxWidth:.infinity)
                }
                .foregroundColor(Color("AmazonDBlue"))
                .background(Color("AmazonGray"))
            }
            
            Rectangle()
                .fill(Color("AmazonDBlue"))
                .frame(height:100)
                .ignoresSafeArea(.all)
        }
    }
    
    private func commentListView(_ comments: [Comment]) -> some View {
        ForEach(comments) { comment in
            HStack(spacing: 10) {
                Spacer()
                Text(comment.user.name)
                    .font(.system(size: 15))
                    .frame(width:75)
                Color.black.frame(width: 5 / UIScreen.main.scale)
                Text(comment.text)
                Spacer()
            }
            .padding([.top, .bottom], 10)
            .foregroundColor(Color("AmazonDBlue"))
            .border(Color.black)
        }
    }
}

struct DealView_Previews: PreviewProvider {
    static var previews: some View {
        DealView(deal:mock.data)
    }
}
