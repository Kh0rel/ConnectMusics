//
//  Playlist.swift
//  ConnectMusics
//
//  Created by guillaume chieb bouares on 04/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import MediaPlayer

public class CMPlaylist: NSObject {

    var name:String = ""
    var mediaItem:AnyObject?
    var provider:ProviderType?
    
    public static func initPlaylistFromAppleMusic(playlistItem:MPMediaPlaylist) -> CMPlaylist {
        let playlistInstance:CMPlaylist = CMPlaylist()
        
        playlistInstance.name = playlistItem.name!
        playlistInstance.mediaItem = playlistItem
        playlistInstance.provider = .appleMusic
        
        return playlistInstance
    }
}
