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
    
    static let schema: String = "Actor"
    
    @ID(key: .id)
    var id : UUID?
    
    @Field(key: "name")
    var name : String
    
    init(){}
    
    init(id : UUID , name : String)
    {
        self.id = id
        self.name = name
    }
}
