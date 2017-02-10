//
//  CMAppleMusicProviderManager.swift
//  ConnectMusics
//
//  Created by guillaume chieb bouares on 04/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

class CMAppleMusicProviderManager: CMBaseProvider {

    var type: ProviderType? = .appleMusic
    
    func createProviderInstance(cliendID:String?,clientSecret:String?,username:String?,password:String?) -> CMBaseProvider {
        return CMAppleMusicProviderManager()
    }
    
    func getSongs() {
        
    }
    
    func getPlaylists() {
        
    }
    
    func getAlbum() {
        
    }
    
    
}
