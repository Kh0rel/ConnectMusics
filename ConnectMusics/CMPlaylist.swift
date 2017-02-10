//
//  Playlist.swift
//  ConnectMusics
//
//  Created by guillaume chieb bouares on 04/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

class CMPlaylist: NSObject {

    var name:String = ""
    var url:String?
    var mediaItem:Any?
    var provider:ProviderType?
    
    static public func initPlaylistFromJSON() -> CMPlaylist {
        
        
        return CMPlaylist()
    }
}
