//
//  CMSpotifyProviderManager.swift
//  ConnectMusics
//
//  Created by Meryl Barantal on 12/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import UIKit

public class CMSpotifyProviderManager: CMBaseProvider {
    
    public var type: ProviderType = .spotify
    var spotifyNetwork:CMSpotifyProviderNetwork
    
    fileprivate init(cliendID: String?, clientSecret: String?, redirect_uri: String?, scopeNeeded: String?) {
        spotifyNetwork = CMSpotifyProviderNetwork(clientID: cliendID!, clientSecret: clientSecret!, redirectURI: redirect_uri!, scopeNeeded: scopeNeeded)
    }
    
    public static func createProviderInstance(cliendID: String?, clientSecret: String?, redirect_uri: String?, scopeNeeded: String?) -> CMBaseProvider {
        let managerInstance:CMSpotifyProviderManager = CMSpotifyProviderManager(cliendID: cliendID, clientSecret: clientSecret, redirect_uri: redirect_uri, scopeNeeded: scopeNeeded)
        return managerInstance
    }
    
    public func login(withAuthenticationCode: String) {
        spotifyNetwork.getUserToken(authenticationCode: withAuthenticationCode)
    }
    
    public func getPlaylists(completionHandler:@escaping (_ error:String?) -> Void) {
        guard spotifyNetwork.clientInformation["access_token"] != nil else {
            completionHandler(nil,"NO TOKEN AVAILABLE")
            return
        }

        spotifyNetwork.getPlaylists(completionHandler: { (result:[CMSpotifyPlaylist]?, error:String?) in
            if error == nil {
                var playlists:[CMPlaylist] = []
                for spotifyPlaylist in result {
                    playlists.append(CMPlaylist.initPlaylistFromSpotify(playlistItem: spotifyPlaylist))
                }
                completionHandler(nil)
                CMSharedProviders.sharedInstance.appendPlaylist(provider:.spotify,playlistToAdd:playlists)
            } else {
                completionHandler(error)
            }
            
        })
        
    }
    
    public func getMe(completionHandler:@escaping (error:String?)){
        guard spotifyNetwork.clientInformation["access_token"] != nil else {
            completionHandler(nil,"NO TOKEN AVAILABLE")
        }
        
        spotifyNetwork.getMe { (error:String?) in
            if error != nil {
                completionHandler(error)
            } else {
                completionHandler(nil)
            }
        }
    }
    
    public func getTracks(playlistToUpdate:CMPlaylist,completionHandler:@escaping (_ playlistUpdated:CMPlaylist?,_ error:String?) -> Void) {
        guard playlistToUpdate.provider == .spotify else {
            completionHandler(nil,"ERROR - Playlist : \(playlist.Updated.name) IS NOT A SPOTIFY Playlist")
        }
        var playlistID = (playlistToUpdate.mediaItem as? CMSpotifyPlaylist)?.id
        spotifyNetwork.getTracks(playlistID:playlistID) { (tracks:[CMSpotifyTrack]?, error:String?) in
            if error == nil {
                (playlistToUpdate.mediaItem as! CMSpotifyPlaylist).tracks = tracks
                completionHandler(playlistToUpdate,nil)
            }
            else {
                completionHandler(nil,error)
            }
        }
    }
}
