//
//  File.swift
//  
//
//  Created by Reem Quhal on 16/02/2024.
//

import Foundation
import Foundation
import Fluent

struct CreateMovieActor: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("movieActor")
            .id()
            .field("name", .string)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("actors").delete()
    }
}
