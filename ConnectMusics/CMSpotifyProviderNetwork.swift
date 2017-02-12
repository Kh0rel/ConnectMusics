//
//  CMSpotifyProviderNetwork.swift
//  ConnectMusics
//
//  Created by Meryl Barantal on 12/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CMSpotifyProviderNetwork {
    func GetAuthCode(clientID: String, redirectURI: String, scopeNeeded: String?) {
        let scope = scopeNeeded ?? "playlist-read-private playlist-read-collaborative user-library-read user-read-private user-top-read"
        let url = URL(string: "https://accounts.spotify.com/authorize/?client_id=\(clientID)&response_type=code&redirect_uri=\(redirectURI)&scope=\(scope)")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        
    }
        
    func GetTokens(clientID: String, clientSecret : String, redirectURI : String, authCode : String) {
            let client = clientID + ":" + clientSecret
            let data = (client as NSString).data(using: String.Encoding.utf8.rawValue)
            let base64 = data!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
            let parameters = [
                "grant_type" : "authorization_code",
                "code" : authCode.replacingOccurrences(of: "\(redirectURI)?code=", with: ""),
                "redirect_uri" : redirectURI
            ]
            let headers = [
                "Authorization" : "Basic " + base64
                
            ]
            Alamofire.request("https://accounts.spotify.com/api/token", method: .post, parameters: parameters, headers: headers).responseJSON(completionHandler: { (response:DataResponse<Any>) in
                let data = JSON(data: response.data!)
                let tokens = [
                    "access_token" : data["access_token"].string,
                    "refresh_token" : data["refresh_token"].string
                ]
            })
            
            //return tokens
            
        }
    
   /* func getPlaylists(accesToken : String) -> CMPlaylist {
        
    }*/

}
