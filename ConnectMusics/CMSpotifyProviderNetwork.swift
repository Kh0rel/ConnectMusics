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

public class CMSpotifyProviderNetwork {
    
    internal var clientInformation:[String:String] = [:]
    
    init(clientID:String,clientSecret:String,redirectURI:String,scopeNeeded:String?) {
        clientInformation["client_id"] = clientID
        clientInformation["client_secret"] = clientSecret
        clientInformation["redirect_uri"] = redirectURI
        clientInformation["scopeNeeded"] = scopeNeeded ?? "playlist-read-private playlist-read-collaborative user-library-read user-read-private user-top-read"
        applicationAuthentication()
    }
    
    private func applicationAuthentication() {
        let url = URL(string: "https://accounts.spotify.com/authorize/?client_id=\(clientInformation["client_id"]!)&response_type=code&redirect_uri=\(clientInformation["redirect_uri"]!)&scope=\((clientInformation["scopeNeeded"]?.replacingOccurrences(of: " ", with: "%20"))!)")
            UIApplication.shared.openURL(url!)
    }
    
    public func getUserToken(authenticationCode: String) {
            let client = clientInformation["client_id"]! + ":" + clientInformation["client_secret"]!
            let data = (client as NSString).data(using: String.Encoding.utf8.rawValue)
            let base64 = data!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
            let parameters = [
                "grant_type" : "authorization_code",
                "code" : authenticationCode.replacingOccurrences(of: "\(clientInformation["redirect_uri"]!)?code=", with: ""),
                "redirect_uri" : clientInformation["redirect_uri"]!
            ]
            let headers = [
                "Authorization" : "Basic " + base64
                
            ]
            Alamofire.request("https://accounts.spotify.com/api/token", method: .post, parameters: parameters, headers: headers).responseJSON(completionHandler: { (response:DataResponse<Any>) in
                let data = JSON(data: response.data!)
                self.clientInformation["access_token"] = data["access_token"].string
                self.clientInformation["refresh_token"] = data["refresh_token"].string
            })
        }
    
    func getPlaylists(completionHandler:@escaping ([CMSpotifyPlaylist]?,String?) -> Void){
        let headers = [
            "Authorization" : "Bearer " + clientInformation["access_token"]!
        ]
        
        Alamofire.request("https://api.spotify.com/v1/me/playlists", method: .get, headers: headers).responseJSON { (playlists : DataResponse<Any>) in
            var listPlaylists : [CMSpotifyPlaylist] = []
            let jsonOjects = JSON(playlists)
            for jsonObject in jsonOjects["items"] {
                listPlaylists.append(CMSpotifyPlaylist.initCMSpotifyPlaylistFromJSON(playlist: jsonObject.1))
            }
            if listPlaylists.count > 0 {
                completionHandler(listPlaylists, nil)
            } else {
                completionHandler(nil, "NO PLAYLIST FOUND")
            }
        }
    }
    
    func getTracks(playlistID : String, completionHandler:@escaping ([CMSpotifyTrack]?, String?) -> Void) {
        guard clientInformation["userID"] != nil else {
            completionHandler(nil,"Please refresh User information [GETME()] for this request")
            return
        }
        let headers = [
            "Authorization" : "Bearer " + clientInformation["access_token"]!
        ]
        
        Alamofire.request("https://api.spotify.com/v1/users/\(clientInformation["userID"]!)/playlists/\(playlistID)/tracks", method: .get, headers: headers).responseJSON { (tracks : DataResponse<Any>) in
            var listTracks : [CMSpotifyTrack] = []
            let jsonOjects = JSON(tracks)
            for jsonObject in jsonOjects["items"] {
                listTracks.append(CMSpotifyTrack.initCMSpotifyTrack(track: jsonObject.1))
            }
            if listTracks.count > 0 {
                completionHandler(listTracks, nil)
            } else {
                completionHandler(nil, "NO TRACK FOUND")
            }
        }
    }
    
    func getMe(completionHandler:@escaping (_ error:String?) -> Void) {
        let headers = [
            "Authorization" : "Bearer " + clientInformation["access_token"]!
        ]
        
        Alamofire.request("https://api.spotify.com/v1/me", method: .get, headers: headers).responseJSON { (userInformations : DataResponse<Any>) in
            if userInformations.response?.statusCode == 200 {
                let jsonObject = JSON(userInformations)
                self.clientInformation["userID"] = jsonObject["id"].string!
                completionHandler(nil)
            } else {
                completionHandler("CODE :  \(userInformations.response?.statusCode)  ERROR : \(userInformations.error?.localizedDescription)")
            }
        }
    }

}
