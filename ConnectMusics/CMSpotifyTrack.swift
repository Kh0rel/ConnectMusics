//
//  CMSpotifyTrack.swift
//  ConnectMusics
//
//  Created by Meryl Barantal on 12/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import UIKit
import SwiftyJSON

class CMSpotifyTrack: NSObject {
    let albumName : String
    let albumUrl : URL
    let albumId : String
    let albumImage : URL
    let url : URL
    let id : String
    let name : String
    
    init(track: JSON) {
        self.albumName = track["album"]["name"].string!
        self.albumUrl = track["album"]["external_urls"]["spotify"].url!
        self.albumId = track["album"]["id"].string!
        self.albumImage = track["album"]["images"][0]["url"].url!
        self.url = track["external_urls"]["spotify"].url!
        self.id = track["id"].string!
        self.name = track["name"].string!
    }
    public static func initCMSpotifyTrack(track : JSON) -> CMSpotifyTrack {
        return CMSpotifyTrack(track: track)
    }
}
