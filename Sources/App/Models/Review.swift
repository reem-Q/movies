//
//  File.swift
//  
//
//  Created by Reem Quhal on 16/02/2024.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

final class Review : Model , Content {
    
    static let schema = "reviews"
    
    @ID(key: .id)
    var id : UUID?
    
    @Field(key: "title")
    var title : String
    
    @Field(key: "body")
    var body : String
    
    
    //Review belong to moview 
    @Parent(key: "movie_id") //FK
    var movie : Movie
    
    init() {}
    
    init(id : UUID , title : String , body : String , movieid : UUID) {
        self.id = id
        self.title = title
        self.body = body
        self.$movie.id = movieid

    }
}
