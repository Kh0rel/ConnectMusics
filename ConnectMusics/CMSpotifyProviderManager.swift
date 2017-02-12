//
//  CMSpotifyProviderManager.swift
//  ConnectMusics
//
//  Created by Meryl Barantal on 12/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import UIKit

class CMSpotifyProviderManager: CMBaseProvider {
    var type: ProviderType? = .spotify
    
    func createProviderInstance(cliendID:String?,clientSecret:String?,username:String?,password:String?) -> CMBaseProvider {
        
    }
    
    func getPlaylists(completionHandler:@escaping (_ playlists:[CMPlaylist]?,_ error:String?) -> Void) {
        
    }
    
}
