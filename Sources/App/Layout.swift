//
//  Layout.swift
//  App
//
//  Created by Eric Jacobsen on 5/13/18.
//

import Fluent
import FluentSQLite
import Vapor

final class Layout: Content, SQLiteModel, Parameter {
    var id: Int?
    var name: String

    var siblingArticles: Siblings<Layout, Article, LayoutArticlePivot> {
        return siblings(related: Article.self, through: LayoutArticlePivot.self, \LayoutArticlePivot.layoutID, \LayoutArticlePivot.articleID)
    }
    
    init( id: Int?, name: String ) {
        self.id = id
        self.name = name
    }
}

extension Layout: Migration {}
