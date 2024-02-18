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

final class MovieActor : Model {
    
    static let schema: String = "Movie_Actor"
    
    @ID(key: .id)
    var id : UUID?
    
    @Parent(key: "movie_id") //FK
    var movie : Movie
    
    
    @Parent(key: "actor_id") //FK
    var actror : Actor

    init(){}
    
    init(id:UUID , movieId : UUID , acrtorid : UUID )
    {
        self.id = id
        self.$movie.id = movieId
        self.$actror.id = acrtorid
        
    }
    
}
