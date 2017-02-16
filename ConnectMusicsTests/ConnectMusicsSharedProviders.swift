//
//  ConnectMusicsSharedProviders.swift
//  ConnectMusics
//
//  Created by guillaume chieb bouares on 15/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import XCTest
@testable import ConnectMusics

class ConnectMusicsSharedProviders: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddProviders() {
        CMSharedProviders.sharedInstance.addProviders(provider: .appleMusic, clientID: nil, clientSecret: nil, redirectURI: nil, scopeNeeded: nil) { (message:String) in
            XCTAssertEqual(message, "Apple music provider is correctly created")
            var provider = CMSharedProviders.sharedInstance.getProvider(wantedProvider: .appleMusic)
            XCTAssertEqual(provider?.type, .appleMusic)
        }
        
    }
    
    func testGetAppleMusicPlaylist(){
        var listToAdd:[CMPlaylist] = []
        for i in 0..<4 {
            var playlist = CMPlaylist()
            playlist.name = "\(i)"
            playlist.provider = .appleMusic
            listToAdd.append(playlist)
        }
        CMSharedProviders.sharedInstance.playlists = listToAdd
        var list = CMSharedProviders.sharedInstance.getPlaylistsByProviderType(providerType: .appleMusic)
        XCTAssertEqual(list?.count, listToAdd.count)
        XCTAssertEqual(list?[0].provider, listToAdd[0].provider)
        
    }
    func testGetSpotifyPlaylist() {
        var listToAdd:[CMPlaylist] = []
        for i in 0..<4 {
            var playlist = CMPlaylist()
            playlist.name = "\(i)"
            playlist.provider = .spotify
            listToAdd.append(playlist)
        }
        CMSharedProviders.sharedInstance.playlists = listToAdd
        var list = CMSharedProviders.sharedInstance.getPlaylistsByProviderType(providerType: .spotify)
        XCTAssertEqual(list?.count, listToAdd.count)
        XCTAssertEqual(list?[0].provider, listToAdd[0].provider)
    }
    
}
