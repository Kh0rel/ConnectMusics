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
    
    internal var clientInformation:[String:String] = [:]
    
    init(clientID:String,clientSecret:String,redirectURI:String,scopeNeeded:String?) {
        clientInformation["client_id"] = clientID
        clientInformation["client_secret"] = clientSecret
        clientInformation["redirect_uri"] = redirectURI
        clientInformation["scopeNeeded"] = scopeNeeded ?? "playlist-read-private playlist-read-collaborative user-library-read user-read-private user-top-read"
        applicationAuthentication()
    }
    
    private func applicationAuthentication() {
        let url = URL(string: "https://accounts.spotify.com/authorize/?client_id=\(clientInformation["client_id"])&response_type=code&redirect_uri=\(clientInformation["redirect_uri"])&scope=\(clientInformation["scopeNeeded"])")
        if Double(UIDevice().systemVersion)! > 10.0 {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url!)
        }
    }
    
    func getUserToken(authenticationCode: String) {
            let client = clientInformation["client_id"]! + ":" + clientInformation["client_secret"]!
            let data = (client as NSString).data(using: String.Encoding.utf8.rawValue)
            let base64 = data!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
            let parameters = [
                "grant_type" : "authorization_code",
                "code" : authenticationCode.replacingOccurrences(of: "\(clientInformation["redirect_uri"])?code=", with: ""),
                "redirect_uri" : clientInformation["redirect_uri"]
            ]
            let headers = [
                "Authorization" : "Basic " + base64
                
            ]
            Alamofire.request("https://accounts.spotify.com/api/token", method: .post, parameters: parameters, headers: headers).responseJSON(completionHandler: { (response:DataResponse<Any>) in
                let data = JSON(data: response.data!)
                self.clientInformation["access_token"] = data["access_token"].string
                self.clientInformation["refresh_token"] = data["refresh_token"].string
            })
            
            //return tokens
            
        }
    
    func getPlaylists() {
        //TODO
    }

}
