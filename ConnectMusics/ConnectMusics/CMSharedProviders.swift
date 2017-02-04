//
//  CMSharedProviders.swift
//  ConnectMusics
//
//  Created by guillaume chieb bouares on 31/01/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//



class CMSharedProviders: NSObject {

    internal static let sharedInstance = CMSharedProviders()
    
    private var playlists:[CMPlaylist] = []
    
    private var providersInstance:[CMBaseProvider] = []
    
    internal func addProviders(provider:ProviderType,clientID:String? = nil,clientSecret:String? = nil,username:String? = nil,password:String? = nil) {
        //Condition If an provider already exist
        switch provider {
        case .appleMusic:
            break
        case .spotify:
            break
        default:
            break
        }
    }
    
    public func getProvider(wantedProvider:ProviderType) -> CMBaseProvider? {
        for provider in providersInstance {
            if provider.type == wantedProvider {
                return provider
            }
        }
        return nil
    }
    // TODO UNIT TEST ONLY A PROVIDER TYPE DEFINED IN PARAMATER
    public func getPlaylistsByProviderType(providerType:ProviderType) -> [CMPlaylist]? {
        var filteredPlaylists:[CMPlaylist] = []
        
        for playlist in playlists {
            if playlist.provider == providerType {
                filteredPlaylists.append(playlist)
            }
        }
        if filteredPlaylists.count > 0 {
            return nil
        }
        
        return filteredPlaylists
    }
    
    
}
