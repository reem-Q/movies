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

final class Actor  : Content , Model {
    
    static let schema: String = "actors"
    
    @ID(key: .id)
    var id : UUID?
    
    @Field(key: "name")
    var name : String
    
    @Siblings(through: MovieActor.self, from: \.$actror, to: \.$movie)
    var movies : [Movie]
    
    init(){}
    
    init(id : UUID , name : String)
    {
        self.id = id
        self.name = name
    }
}
