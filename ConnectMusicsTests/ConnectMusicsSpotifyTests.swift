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
        clientInformations["access_token"] = "QCLptMvzliGZfrNnfb8OnaS55KV3BPj9s8wjuPQyJHFHMc0ew7WM1Ph65st-1_twvkXKRxsdMfpd8UbBKWik92CC5kF3lh4maRYHpwIERQtwU6JqndTHiTfdlWiSUYKcoQH3AXssBW2AItwB6LjrAswGB8afiDrNMoZYvCh64fYbKBaxA-8QWN7F6IOGlMoWOX8zXhn"
        clientInformations["refresh_token"] = "AQBxffMlLhk9onQ1GU52ju4-H1-ijysbFwl0QMgP8R7V0vFvRqnI1buztkWkeU6tnmS30B05COCLusf1ZJ-YYqaT7uQQ4GoEH1r9E5UwW31WE6L9zinFwh3Ugd2tKluEKC8"
        clientInformations["user_id"] = "tictakitkat"
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetMe() {
        
        
    }
    
}
