//
//  CMSpotifyTrack.swift
//  ConnectMusics
//
//  Created by Meryl Barantal on 12/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import UIKit
import SwiftyJSON

public class CMSpotifyTrack: NSObject {
    public let albumName : String
    public let albumUrl : URL
    public let albumId : String
    public let albumImage : URL
    public let url : URL
    public let id : String
    public let name : String
    
    init(track: JSON) {
        self.albumName = track["track"]["album"]["name"].stringValue
        self.albumUrl = track["track"]["album"]["external_urls"]["spotify"].url!
        self.albumId = track["track"]["album"]["id"].stringValue
        self.albumImage = track["track"]["album"]["images"][0]["url"].url!
        self.url = track["track"]["external_urls"]["spotify"].url!
        self.id = track["track"]["id"].stringValue
        self.name = track["track"]["name"].stringValue
    }
    public static func initCMSpotifyTrack(track : JSON) -> CMSpotifyTrack {
        return CMSpotifyTrack(track: track)
    }
}
