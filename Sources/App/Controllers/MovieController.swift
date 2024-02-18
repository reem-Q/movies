//
//  File.swift
//  
//
//  Created by Reem Quhal on 14/02/2024.
//

import Foundation
import Vapor
import Fluent
final class MovieController : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        let movie = routes.grouped("Movies")
        movie.post(use: addNewMovie)
        
        movie.get(use: getMovies)

        movie.put(use: updatdMovies)
        
        movie.delete(":movieid" , use:delete)
        

    }
    
    func addNewMovie (req : Request) async throws -> Movie {
        let movie = try req.content.decode(Movie.self)
        try await movie.create(on: req.db)
        return movie
    }
    
    func getMovies (req : Request) async throws -> [Movie] {
        return try await Movie.query(on: req.db).with(\.$actors).with(\.$reviews).all()
    }
    
    func updatdMovies (req : Request) async throws -> Movie {
        let movie = try req.content.decode(Movie.self)
        
        let movieToUpdate =  try await Movie.find(movie.id , on: req.db)
        
        guard let movieToUpdate else {
            throw Abort(.notFound)
        }
        movieToUpdate.title = movie.title
        
        try await movieToUpdate.save(on: req.db)
        return movieToUpdate
    }
    
    func delete ( req : Request) async throws -> Movie {
        let movieToDelete = try await Movie.find(req.parameters.get("movieid") , on: req.db)
        guard let movieToDelete else {
            throw Abort(.notFound)
        }
        try await movieToDelete.delete(on: req.db)
        
        return movieToDelete
        
    }
    
}
