//
//  File.swift
//  
//
//  Created by Reem Quhal on 16/02/2024.
//

import Foundation
import Foundation
import Fluent

struct CreateActor: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("Actor")
            .id()
            .field("title", .string)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("movie").delete()
    }
}
