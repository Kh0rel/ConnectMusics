//
//  CMSpotifyPlaylists.swift
//  ConnectMusics
//
//  Created by Meryl Barantal on 12/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import UIKit
import SwiftyJSON

public class CMSpotifyPlaylist : NSObject {
    
    public var name : String = ""
    public var id : String = ""
    public var owner : String = ""
    public var is_public : Bool = true
    public var tracks : [CMSpotifyTrack] = []
    
    override init(){
        super.init()
    }
    
    init(playlist : JSON) {
        self.name = playlist["name"].stringValue
        self.id = playlist["id"].stringValue
        self.owner = playlist["owner"]["id"].stringValue
        self.is_public = playlist["public"].boolValue
    }
    
    public static func initCMSpotifyPlaylistFromJSON(playlist : JSON) -> CMSpotifyPlaylist {
       return CMSpotifyPlaylist(playlist: playlist)
    }
}
