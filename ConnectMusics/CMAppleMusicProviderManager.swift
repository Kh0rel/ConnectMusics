//
//  CMAppleMusicProviderManager.swift
//  ConnectMusics
//
//  Created by guillaume chieb bouares on 04/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import MediaPlayer

class CMAppleMusicProviderManager: CMBaseProvider {

    var type: ProviderType? = .appleMusic
    var appleMusicNetwork: CMAppleMusicProviderNetwork = CMAppleMusicProviderNetwork()
    
    func createProviderInstance(cliendID:String?,clientSecret:String?,username:String?,password:String?) -> CMBaseProvider {
        return CMAppleMusicProviderManager()
    }
    func getPlaylists(completionHandler:@escaping (_ playlists:[CMPlaylist]?,_ error:String?) -> Void) {
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