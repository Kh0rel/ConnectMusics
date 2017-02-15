//
//  CMAppleMusicProviderManager.swift
//  ConnectMusics
//
//  Created by guillaume chieb bouares on 04/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import MediaPlayer

public class CMAppleMusicProviderManager: CMBaseProvider {
    
    public var type: ProviderType? = .appleMusic
    var appleMusicNetwork: CMAppleMusicProviderNetwork = CMAppleMusicProviderNetwork()
    
    public static func createProviderInstance(cliendID: String?, clientSecret: String?, redirect_uri: String?, scopeNeeded: String?) -> CMBaseProvider {
        return CMAppleMusicProviderManager()
    }
    
    public func getPlaylists(completionHandler:@escaping (_ playlists:[CMPlaylist]?,_ error:String?) -> Void) {
        appleMusicNetwork.retrievePlaylistSubscription { (retrievedPlaylist:[MPMediaPlaylist]?, error:String?) in
            if error != nil {
                var abstractPlaylists:[CMPlaylist] = []
                for playlist in retrievedPlaylist! {
                    abstractPlaylists.append(CMPlaylist.initPlaylistFromAppleMusic(playlistItem: playlist))
                }
                completionHandler(abstractPlaylists,nil)
            } else {
                completionHandler(nil,error)
            }
        }
    }
}
