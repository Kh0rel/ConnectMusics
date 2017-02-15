//
//  ConnectMusicsSpotifyTests.swift
//  ConnectMusics
//
//  Created by Meryl Barantal on 15/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import ConnectMusics

class ConnectMusicsSpotifyTests: XCTestCase {
    internal var clientInformations:[String:String] = [:]

    override func setUp() {
        super.setUp()
        
        let path = Bundle.main.url(forResource: "clientInformations", withExtension: "json")
        let data = NSData(contentsOf: path!)
        let json = JSON(data: data as! Data)
        clientInformations["access_token"] = json["access_token"].string!
        clientInformations["refresh_token"] = json["refresh_token"].string!
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetMe() {
        
    }
    
}
