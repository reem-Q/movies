//
//  File.swift
//  
//
//  Created by Reem Quhal on 16/02/2024.
//

import Foundation
import Vapor
struct ReviewController : RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let review = routes.grouped("Reviews")
        
        review.post(use : createReview)
        
        review.get(use : getReviews)

    }
    
    
    
    func createReview (req : Request) async throws -> Review {
        let review = try req.content.decode(Review.self)
        try await review.create(on: req.db)
        return review
    }
    
    
    func getReviews (req : Request) async throws -> [Review]{
        return try await Review.query(on: req.db).all()
    }
}
