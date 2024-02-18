//
//  File.swift
//  
//
//  Created by Reem Quhal on 16/02/2024.
//

import Foundation



import Foundation
import Vapor
import Fluent
final class MovieActorrContoller : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        
       // let movieActor = routes.grouped("movieActor")
        routes.post("movie" , ":movieid" , "actor" , ":actorid" , use: addNewMovieActor)
        
        
        
    }
    
    func addNewMovieActor (req : Request) async throws -> String  {
        
        do {
            
            let movie = try await Movie.find(req.parameters.get("movieid"), on: req.db)
            guard let movie else {
                throw Abort(.notFound)
            }
            
            let actor = try await Actor.find(req.parameters.get("actorid"), on: req.db)
            guard let actor else {
                throw Abort(.notFound)
            }
            
            
            try await movie.$actors.attach(actor, on: req.db)
            
//            try await movie.$actrors.attach(actor, on: req.db) { pivot in
//               in case there is a extra values need to set.
//                
//            }
        }

        
        
       return "added!!"
    }
}


