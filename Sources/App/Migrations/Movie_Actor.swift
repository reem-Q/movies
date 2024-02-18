//
//  File.swift
//  
//
//  Created by Reem Quhal on 16/02/2024.
//

import Foundation
import Foundation
import Fluent

struct CretaeMovieActor: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("Movie_Actor")
            .id()
            .field("movie_id", .uuid , .required , .references("movie", "id"))
            .field("actor_id", .uuid , .required , .references("actors", "id"))
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("Movie_Actor").delete()
    }
}
