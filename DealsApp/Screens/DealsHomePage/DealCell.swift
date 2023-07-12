//
//  DealCell.swift
//  DealsApp
//
//  Created by Jon Chang on 7/6/23.
//

import SwiftUI

struct DealCell: View {
    @State var deal:Deal
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: deal.product.image)) { image in
                image
                    .resizable()
                    .frame(width: 120, height: 150)
                    .aspectRatio(contentMode:.fit)
                    .cornerRadius(10)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 120, height: 150)
                    .aspectRatio(contentMode:.fit)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(deal.title)
                    .bold()
                    .font(.system(size: 20))
                    .padding([.bottom], 5)
                    .foregroundColor(Color("AmazonDBlue"))
                Text("\"" + deal.description + "\"")
                    .font(.system(size:14))
                    .italic()
                    .padding([.bottom], 10)
                    .foregroundColor(Color("AmazonLBlue"))
                Text("$" + String(format: "%.2f", Float(deal.price)/100))
                    .font(.system(size:25))
                    .foregroundColor(Color("AmazonDBlue"))
            }
        }
        .frame(maxWidth: 350)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .border(Color.black)
    }
}

struct DealCell_Previews: PreviewProvider {
    static var previews: some View {
        DealCell(deal: mock.data)
    }
}
