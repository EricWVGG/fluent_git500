//
//  LayoutController.swift
//  App
//
//  Created by Eric Jacobsen on 5/20/18.
//

import Vapor
import Fluent

struct LayoutController: RouteCollection {
    
    func boot(router: Router) throws {
        let routes = router.grouped("v1")
        routes.get("layout", Layout.parameter, use: getOneHandler)
    }
    
    func getOneHandler(_ req: Request) throws -> Future<PublicLayout> {
        return try req.parameters.next(Layout.self).flatMap(to: PublicLayout.self) { layout in
            return try PublicLayout.make(from: layout, on: req)
        }
    }

}
