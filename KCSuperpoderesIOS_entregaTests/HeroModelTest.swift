//
//  HeroModelTest.swift
//  KCSuperpoderesIOS_entregaTests
//
//  Created by Camila Laura Lopez on 2/4/23.
//

import XCTest

final class HeroModelTest: XCTestCase {

    var hero: Hero!

    override func setUp() {
        super.setUp()
        
        hero = Hero(id: 134567, name: "Capitan America", description: "Lorem Lorem", thumbnail: Thumbnail(path: "", thumbnailExtension: ""))
    }

    override func tearDown() {
        hero = nil
        
        super.tearDown()
    }
        
       
    func testHeroName() {
          
            let name = hero.name
            
            XCTAssertNotNil(hero)
            XCTAssertNotNil(name)
            XCTAssertEqual(name, "Capitan America")
        }
        
        func testHeroID() {
            
            let id = hero.id
            
            XCTAssertNotNil(id)
            XCTAssertGreaterThan(id, 0)
        }

    }
