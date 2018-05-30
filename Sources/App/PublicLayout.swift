//
//  PublicLayout.swift
//  App
//
//  Created by Eric Jacobsen on 5/24/18.
//
//  This class outputs a Layout with its Articles siblings.

import Vapor
import Fluent
import FluentSQLite


final class PublicLayout: Content {
    let id          : Int
    let name        : String
    let articles    : [Article]?
    
    static func make(from layout: Layout, on req: Request) throws -> Future<PublicLayout> {
        return try layout.siblingArticles.query(on: req).all().map(to: PublicLayout.self) { articles in
            return try self.init(
                try layout.requireID(),
                layout.name,
                articles
            )
        }
    }
    
    init(
        _ id          : Int,
        _ name        : String,
        _ articles    : [Article]?
    ) throws {
        self.id          = id
        self.name        = name
        self.articles    = articles
    }
}
