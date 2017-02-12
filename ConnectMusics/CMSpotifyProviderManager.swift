//
//  CMSpotifyProviderManager.swift
//  ConnectMusics
//
//  Created by Meryl Barantal on 12/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import UIKit

public class CMSpotifyProviderManager: CMBaseProvider {
    
    public var type: ProviderType? = .spotify
    var spotifyNetwork:CMSpotifyProviderNetwork
    
    fileprivate init(cliendID: String?, clientSecret: String?, redirect_uri: String?, scopeNeeded: String?) {
        spotifyNetwork = CMSpotifyProviderNetwork(clientID: cliendID!, clientSecret: clientSecret!, redirectURI: redirect_uri!, scopeNeeded: scopeNeeded)
    }
    
    public static func createProviderInstance(cliendID: String?, clientSecret: String?, redirect_uri: String?, scopeNeeded: String?) -> CMBaseProvider {
        let managerInstance:CMSpotifyProviderManager = CMSpotifyProviderManager(cliendID: cliendID, clientSecret: clientSecret, redirect_uri: redirect_uri, scopeNeeded: scopeNeeded)
        return managerInstance
    }
    
    public func login(withAuthenticationCode:String) {
        spotifyNetwork.getUserToken(authenticationCode: withAuthenticationCode)
    }
    
    public func getPlaylists(completionHandler:@escaping (_ playlists:[CMPlaylist]?,_ error:String?) -> Void) {
        guard spotifyNetwork.clientInformation["access_token"] != nil else {
            completionHandler(nil,"NO TOKEN AVAILABLE")
            return
        }
        //TODO MEthod getPlaylists + callback result
        spotifyNetwork.getPlaylists()
        
    }
    
}
