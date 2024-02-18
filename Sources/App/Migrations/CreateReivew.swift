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

struct CreateReivew : Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("reviews")
            .id()
            .field("title" , .string)
            .field("body" , .string)
            .field("movie_id" , .uuid , .references("movie", "id"))
            .create()


    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("reviews").delete()
    }
    
    
}
