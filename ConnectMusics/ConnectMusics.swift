//
//  ConnectMusics.swift
//  ConnectMusics
//
//  Created by guillaume chieb bouares on 31/01/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//


class ConnectMusics: NSObject {
    
    public static let sharedInstance = ConnectMusics()
    
    public func getInstance() -> CMSharedProviders {
        return CMSharedProviders.sharedInstance
    }
    
    public func initProvider(provider:ProviderType,clientID:String? = nil,clientSecret:String? = nil,redirectURI:String? = nil,scopeNeeded:String? = nil) {
        self.getInstance().addProviders(provider: provider, clientID: clientID, clientSecret: clientSecret, redirectURI: redirectURI, scopeNeeded: scopeNeeded)
    }

}
