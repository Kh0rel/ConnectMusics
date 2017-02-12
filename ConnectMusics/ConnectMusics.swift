//
//  ConnectMusics.swift
//  ConnectMusics
//
//  Created by guillaume chieb bouares on 31/01/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//


public class ConnectMusics: NSObject {
    /*!
     * @brief Singleton Instance , first access to Connect Music framework
     */
    public static let sharedInstance = ConnectMusics()
    /*!
     * @discussion getInstance of CMSharedProviders , allow access to providers handler
     * @return CMSharedProviders singleton instance
     */
    public func getInstance() -> CMSharedProviders {
        return CMSharedProviders.sharedInstance
    }
    
    /*!
     * @discussion simple way to instanciate a new provider.
     * @param provider choose which provider you want to create
     * @param clientID set it if an authentification by Oauth2 is needed
     * @param clientSecret like ClientID this param is required if you need an Oauth2 authentication
     * @param redirectURI it's your URIScheme for retrieve access_token if your provider need one URI
     * @param scopeNeeded it's a permission scheme needed for token creation , it's different for any providers
     *
     * @return The sum of the two numbers passed in.
     */
    public func initProvider(provider:ProviderType,clientID:String? = nil,clientSecret:String? = nil,redirectURI:String? = nil,scopeNeeded:String? = nil) {
        self.getInstance().addProviders(provider: provider, clientID: clientID, clientSecret: clientSecret, redirectURI: redirectURI, scopeNeeded: scopeNeeded)
    }

}
