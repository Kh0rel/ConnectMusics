//
//  CMAppleMusicProviderNetwork.swift
//  ConnectMusics
//
//  Created by guillaume chieb bouares on 04/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.

import MediaPlayer
import StoreKit
import UIKit

public class CMAppleMusicProviderNetwork {

    public func retrievePlaylistSubscription(completionHandler:@escaping ([MPMediaPlaylist]?,String?) -> Void) {
        MPMediaLibrary.requestAuthorization { (authorization:MPMediaLibraryAuthorizationStatus) in
            if authorization != MPMediaLibraryAuthorizationStatus.authorized {
                completionHandler(nil,"NOT AUTHORIZED TO MEDIA LIBRARY ACCESS")
                return
            }
            SKCloudServiceController().requestCapabilities(completionHandler: { (capabilities:SKCloudServiceCapability, error:Error?) in
                if error != nil {
                    let playlistQuery = MPMediaQuery.playlists()
                    if let libraryPlaylists = playlistQuery.collections {
                        var retrievePlaylists:[MPMediaPlaylist] = []
                        for playlist in libraryPlaylists {
                            if let playlist = playlist as? MPMediaPlaylist , playlist.mediaTypes.contains(.music) {
                                retrievePlaylists.append(playlist)
                            }
                        }
                        if retrievePlaylists.count > 0 {
                            completionHandler(retrievePlaylists,nil)
                        } else {
                            completionHandler(nil,"PLAYLIST NOT FOUND")
                        }
                    }
                } else {
                    completionHandler(nil,error?.localizedDescription)
                }
            })
        }
    }
}
