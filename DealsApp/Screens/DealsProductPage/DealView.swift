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
                    .padding([.leading, .trailing])
                Text("$" + String(format: "%.2f", Float(deal.price)/100))
                    .bold()
                    .font(.system(size:50))
                    .padding([.leading])
                
                Color.black.frame(height: 5 / UIScreen.main.scale)
                
                Text("Description:")
                    .font(.system(size: 25))
                    .bold()
                    .padding([.leading])
                Text(deal.product.description)
                    .italic()
                    .padding([.leading, .trailing])
                
                Color.black.frame(height: 5 / UIScreen.main.scale)
                
                Text("Comments:")
                    .font(.system(size: 25))
                    .bold()
                    .padding([.leading])
                commentListView(deal.comments)
                    .frame(maxWidth:.infinity)
                    .background(Color(red:0.671, green:0.624, blue:0.616))
            }
        }
        .foregroundColor(Color(red:0.235, green:0.31, blue:0.463))
        .background(Color(red:0.82, green:0.745, blue:0.69))
    }
    
    private func commentListView(_ comments: [Comment]) -> some View {
        ForEach(comments) { comment in
            HStack(spacing: 10) {
                Text(comment.user.name)
                    .font(.system(size: 15))
                    .frame(width:75)
                Color.black.frame(width: 5 / UIScreen.main.scale)
                Text(comment.text)
            }
            .padding([.leading, .trailing])
            .padding([.bottom], 10)
        }
    }
}

struct DealView_Previews: PreviewProvider {
    static var previews: some View {
        DealView(deal:mock.data)
    }
}
