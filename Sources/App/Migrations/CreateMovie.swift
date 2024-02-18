//
//  File.swift
//  
//
//  Created by Reem Quhal on 14/02/2024.
//

import Foundation
import Fluent

struct CreateMovie: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("movie")
            .id()
            .field("title", .string)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("movie").delete()
    }
}
