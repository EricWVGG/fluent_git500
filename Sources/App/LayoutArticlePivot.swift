//
//  LayoutArticlePivot.swift
//  App
//
//  Created by Eric Jacobsen on 5/16/18.
//

import Foundation
import FluentSQLite

final class LayoutArticlePivot: SQLitePivot, Migration {
    var id: Int?
    var layoutID: Layout.ID
    var articleID: Article.ID
    
    typealias Left = Layout
    typealias Right = Article
    
    static let leftIDKey: LeftIDKey = \.layoutID
    static let rightIDKey: RightIDKey = \.articleID
    
    init(_ layoutID: Layout.ID, _ articleID: Article.ID) {
        self.layoutID = layoutID
        self.articleID = articleID
    }
}

extension LayoutArticlePivot: ModifiablePivot {
    convenience init(_ left: Layout, _ right: Article) throws {
        try self.init(left.requireID(), right.requireID())
    }
}
