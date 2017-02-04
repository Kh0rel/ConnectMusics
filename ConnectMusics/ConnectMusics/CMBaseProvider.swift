//
//  CMBaseProvider.swift
//  ConnectMusics
//
//  Created by guillaume chieb bouares on 31/01/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import Foundation

protocol CMBaseProvider {
    
    var type: ProviderType? { get set }
    
    func loginWithCredentials(cliendID:String?,clientSecret:String?,username:String?,password:String?)
    func getSongs()
    func getPlaylists()
    func getAlbum()
    
}
