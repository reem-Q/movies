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
    }
    
    func addNewMovie (req : Request) async throws -> Movie {
        let movie = try req.content.decode(Movie.self)
        try await movie.create(on: req.db)
        return movie
    }
}
