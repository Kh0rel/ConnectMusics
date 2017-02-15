//
//  ConnectMusicsSpotifyTests.swift
//  ConnectMusics
//
//  Created by Meryl Barantal on 15/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import XCTest
import SwiftyJSON

class ConnectMusicsSpotifyTests: XCTestCase {
    internal var clientInformations:[String:String] = [:]

    override func setUp() {
        super.setUp()
        
        /*let path = Bundle.main.url(forResource: "clientInformations", withExtension: "json")
        let data = NSData(contentsOf: path!)
        let json = JSON(data: data as! Data)
        clientInformations["access_token"] = json["access_token"].string!
        clientInformations["refresh_token"] = json["refresh_token"].string!
        */
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
