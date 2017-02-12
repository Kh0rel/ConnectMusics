//
//  CMSharedProviders.swift
//  ConnectMusics
//
//  Created by guillaume chieb bouares on 31/01/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//



public class CMSharedProviders: NSObject {
    /*!
     * @brief Singleton instance for Providers Handler
     */
    internal static let sharedInstance = CMSharedProviders()
    /*!
     * @brief all playlists retreived from WebService
     */
    private var playlists:[CMPlaylist] = []
    /*!
     * @brief all providersIsnstance create by application
     */
    private var providersInstance:[CMBaseProvider] = []
    
    //TODO UNIT TEST CREATE A NEW PROVIDER 
    //TODO UNIT TEST 2 test second creation of the same provider type -> return error
    
    /*!
     * @discussion method which switch conditon for separate specific ProviderType instructions
     * @param provider choose which provider you want to create
     * @param clientID set it if an authentification by Oauth2 is needed
     * @param clientSecret like ClientID this param is required if you need an Oauth2 authentication
     * @param redirectURI it's your URIScheme for retrieve access_token if your provider need one URI
     * @param scopeNeeded it's a permission scheme needed for token creation , it's different for any providers
     */
     public func addProviders(provider:ProviderType,clientID:String? = nil,clientSecret:String? = nil,redirectURI:String? = nil,scopeNeeded:String? = nil) {
        //Condition If an provider already exist
        switch provider {
        case .appleMusic:
            providersInstance.append(CMAppleMusicProviderManager.createProviderInstance(cliendID: nil, clientSecret: nil, redirect_uri: nil, scopeNeeded: nil))
            break
        case .spotify:
            providersInstance.append(CMSpotifyProviderManager.createProviderInstance(cliendID: clientID, clientSecret: clientSecret, redirect_uri: redirectURI, scopeNeeded: scopeNeeded))
            break
        }
    }
    /*!
     * @discussion method which allow access to specific provider already instanciate
     * @param wantedProvider filter parameter
     * @return Return Provider instance if is exists, else return nil
     */
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
