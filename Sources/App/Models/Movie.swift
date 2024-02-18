//
//  File.swift
//  
//
//  Created by Reem Quhal on 13/02/2024.
//

import Foundation
import Fluent
import Vapor

final class Movie : Model , Content  {

    static let schema = "movie" //table name
    
    @ID(key: .id) //id
    var id : UUID?
    
    @Field(key: "title") //cloume
    var title : String
    
    //moview has many reviews 
    @Children(for: \.$movie)
    var reviews : [Review]
    
    @Siblings(through: MovieActor.self, from: \.$movie, to: \.$actror)
    var actors : [Actor]
    
    init() {}
    
    init(id : UUID? , title : String){
        self.id = id
        self.title = title
    }

    
}
