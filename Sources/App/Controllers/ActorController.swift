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
final class ActorController : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        let actor = routes.grouped("actor")
        
        actor.get(use :readActors)

        actor.post(use : createActor)
    }
    
    func createActor(req : Request) async throws -> Actor
    {
        
        let actor = try req.content.decode(Actor.self)
        try await actor.create(on: req.db)
        return actor
    }
    
    func readActors(req : Request) async throws -> [Actor]
    {
        
        let actors = try await Actor.query(on: req.db).with(\.$movies).all()
        return actors
    }
}
