//
//  CMAppleMusicProviderNetwork.swift
//  ConnectMusics
//
//  Created by guillaume chieb bouares on 04/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.

import MediaPlayer
import StoreKit

class CMAppleMusicProviderNetwork {

    func retrievePlaylistSubscription(completionHandler:@escaping ([MPMediaPlaylist]?,String?) -> Void) {
        MPMediaLibrary.requestAuthorization { (authorization:MPMediaLibraryAuthorizationStatus) in
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


/*
 
 func loadAllPlaylistsFromAM(success:@escaping (_ content:[MPMediaPlaylist]) -> Void,failure:@escaping (_ content:String) -> Void) -> Void {
 var playlists = [MPMediaPlaylist]()
 MPMediaLibrary.requestAuthorization { (authorization) in
 SKCloudServiceController().requestCapabilities { (capabilities, _) in
 self.appleMusicSubscription = capabilities.contains(.musicCatalogPlayback)
 let playlistsQuery = MPMediaQuery.playlists()
 //Here we have all the mobile phone playlist
 if let libraryPlaylists = playlistsQuery.collections {
 //loop the playlist list
 for playlist in libraryPlaylists {
 //if playlist.mediaTypes contains .music or 0 (0 = no items in playlists)
 if let playlist = playlist as? MPMediaPlaylist , playlist.mediaTypes.contains(.music) || playlist.mediaTypes.rawValue == 0{
 if (playlist.value(forProperty: "isFolder")! as! Int) == 0 {
 playlists.append(playlist)
 }
 }
 }
 if(playlists.count > 0){
 success(playlists)
 } else {
 failure(NSLocalizedString("Aucune playlist trouvée", comment: "PLAYLIST_NOT_FOUND_ERROR"))
 print("Error :   \(NSLocalizedString("Aucune playlist trouvée", comment: "PLAYLIST_NOT_FOUND_ERROR"))")
 }
 }
 }
 }
 }
 
 }

 
 */
