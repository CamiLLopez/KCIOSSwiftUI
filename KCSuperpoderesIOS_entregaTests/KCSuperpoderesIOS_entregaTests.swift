//
//  KCSuperpoderesIOS_entregaTests.swift
//  KCSuperpoderesIOS_entregaTests
//
//  Created by Camila Laura Lopez on 26/3/23.
//

import XCTest
@testable import KCSuperpoderesIOS_entrega
import ViewInspector
import SwiftUI
import Combine

@testable import KCSuperpoderesIOS_entrega

final class KCSuperpoderesIOS_entregaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testSerieRowView () throws {
        
        let view = HeroSerieRowView(serie: HeroSerie(id: 1945, title: "Avengers: The Initiative (2007 - 2010)", description: "Lorem Lorem", rating: "T", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", thumbnailExtension: ".jpg")))
        
        let items = try view.inspect().count
        let image = try view.inspect().find(viewWithId: 1)
        let title = try view.inspect().find(viewWithId: 0)
        let textTitle = try title.text().string()
        
        let detail = try view.inspect().find(viewWithId: 2)
        
        XCTAssertNotNil(view)
        XCTAssertNotEqual(items, 2)
        XCTAssertNotNil(image)
        XCTAssertNotNil(title)
        XCTAssertNotNil(detail)
        XCTAssertEqual(textTitle, "Avengers: The Initiative (2007 - 2010)")
    }
    
    func testHeroRowView () throws {
         
         let view = HeroRowView(hero: Hero(id: 1011334, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: ".jpg")))
         
         let image = try view.inspect().find(viewWithId: 0)
        let heroName = try view.inspect().find(viewWithId: 1)
        let name = try heroName.text().string()
        XCTAssertNotNil(image)
        XCTAssertNotNil(heroName)
        XCTAssertNotEqual("", name)
        
        XCTAssertGreaterThanOrEqual(view.hero.id, 1)
     }
}
