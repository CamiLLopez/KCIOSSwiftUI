//
//  SerieModelTest.swift
//  KCSuperpoderesIOS_entrega
//
//  Created by Camila Laura Lopez on 2/4/23.
//

import XCTest

final class SerieModelTest: XCTestCase {

    var serie: HeroSerie!

    override func setUp() {
        super.setUp()
        
        serie = HeroSerie(id: 1245, title: "Avengers", description: "Lorem Lorem", rating: "M", thumbnail: Thumbnail(path: "", thumbnailExtension: ""))
    }

    override func tearDown() {
        serie = nil
        
        super.tearDown()
    }
        
       
    func testSerieTitle() {
          
            let title = serie.title
            
            XCTAssertNotNil(serie)
            XCTAssertNotNil(title)
            XCTAssertEqual(title, "Avengers")
        }
        
   func testSerieID() {
            
            let id = serie.id
            
            XCTAssertNotNil(id)
            XCTAssertGreaterThan(id, 0)
        }
}

