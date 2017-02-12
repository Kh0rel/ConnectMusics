//
//  CMSpotifyPlaylists.swift
//  ConnectMusics
//
//  Created by Meryl Barantal on 12/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import UIKit
import SwiftyJSON

class CMSpotifyPlaylist : NSObject {
    
    var name : String
    var id : String
    var image : URL
    var owner : String
    var is_public : Bool
    var tracks : [CMSpotifyTrack]
    init(playlist : JSON) {
        self.name = playlist["name"].string!
        self.id = playlist["id"].string!
        self.image = playlist["images"]["spotify"].url!
        self.owner = playlist["owner"].string!
        self.is_public = playlist["public"].bool!
    }
    public static func initCMSpotifyPlaylist(playlist : JSON) -> CMSpotifyPlaylist {
       return CMSpotifyPlaylist(playlist: playlist)
    }
}
