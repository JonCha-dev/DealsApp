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
                    .foregroundColor(Color(red:0.22, green:0.247, blue: 0.318))
                Text("\"" + deal.description + "\"")
                    .font(.system(size:14))
                    .italic()
                    .padding([.bottom], 10)
                    .foregroundColor(Color(red:0.867, green:0.859, blue:0.945))
                Text("$" + String(format: "%.2f", Float(deal.price)/100))
                    .font(.system(size:25))
                    .foregroundColor(Color(red:0.22, green:0.247, blue: 0.318))
            }
        }
        .frame(maxWidth: 350)
        .padding()
        .background(Color(red:0.671, green:0.624, blue:0.616))
        .cornerRadius(30)
    }
}

struct DealCell_Previews: PreviewProvider {
    static var previews: some View {
        DealCell(deal: mock.data)
    }
}
