//
//  DealsResponse.swift
//  DealsApp
//
//  Created by Jon Chang on 7/4/23.
//

import Foundation

struct DealsResponse:Decodable {
    let data:DataResponse
}

struct DataResponse:Decodable {
    let deals:[Deal]
}

struct Deal:Decodable, Identifiable {
    let id:String
    let title:String // product name
    let url:String // product url
    let price:Int
    let description:String
    let product:Product
    let comments:[Comment]
}

struct Product:Decodable {
    let availability:String
    let image:String
    let description:String
}

struct Comment:Decodable, Identifiable {
    let id = UUID()
    let text:String
    let user:CommentUser
}

struct CommentUser:Decodable {
    let name:String
}

struct mock {
    static var data = Deal(id: "1",
                               title: "My Arcade All-Star Stadium Pico Player, Universal",
                               url: "https://www.officedepot.com/a/products/9025577/My-Arcade-All-Star-Stadium-Pico/",
                               price: 1999,
                               description: "What a fantastic price on a must-have product - you should totally buy this right now!",
                               product: Product(availability: "IN STOCK",
                                                image: "https://media.officedepot.com/images/t_extralarge%2Cf_auto/products/9025577/9025577_o01.jpg",
                                                description: "Enjoy endless fun when you bring along the My Arcade All-Star Stadium Pico Player. This game console features an ergonomic design and a full-color 2\" screen with a built-in speaker. It includes 7 officially licensed Jaleco titles and 100 retro-style bonus games for versatile fun.  Handheld console with an ergonomic and compact design.  Offers 7 officially licensed Jaleco titles including BASES LOADED 1, 2, 3, and 4, GOAL!, RACKET ATTACK and HOOPS.  Bonus 100 retro-style games for added fun.  Full-color 2\" screen.  Built-in speaker with volume control.  Portable console is ideal for long road trips, commuting to work, travel and more.  Powered by 3 AAA batteries (not included).  Includes a user guide."),
                               comments: [Comment(text: "This deal is fantastic! I used it and saved a lot of money. Thanks for sharing!",
                                                  user: CommentUser(name: "John Doe")),
                                          Comment(text: "This deal is fantastic! I used it and saved a lot of money. Thanks for sharing!",
                                                  user: CommentUser(name: "Not John Doe"))])
}
