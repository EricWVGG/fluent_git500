//
//  Article.swift
//  App
//
//  Created by Eric Jacobsen on 5/13/18.
//

import Vapor
import Fluent
import FluentSQLite

final class Article: Content, SQLiteModel, Parameter {
    var id              : Int?
    var title           : String

    init(
        id              : Int?,
        title           : String
    ) throws {
        self.id                 = id
        self.title              = title
    }
}

extension Article: Migration {}
