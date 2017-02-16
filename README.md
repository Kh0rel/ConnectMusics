# ConnectMusics

ConnectMusics is a framework for simple use of music providers web API for iOS.
You can see a sample application here : https://github.com/shemana/ConnectMusics-sample

- [Features](#features)
- [Requirements](#requirements)
- [Communication](#communication)
- [Installation](#installation)
- [Usage](#usage)
  - **Intro -** [Intro](#intro)
	- **Spotify -** [Authentication](#authentication), [Playlists](#playlists), [Tracks](#tracks)
	- **Apple Music -** [Playlists subscribed](#playlists)
- [FAQ](#faq)
- [Credits](#credits)
- [License](#license)

##Features

- [x] Connection to Spotify API
- [x] Connection to Apple Music API
- [x] Retrieving of Spotify's playlists
- [x] Retrieving of a playlist's tracks from Spotify
- [x] Retrieving of playlists subscribed by a user in Apple Music

##Requirements

- iOS 9.3
- Swift 3.0+
- XCode 8.2+

##Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

##Installation

###Cocoapods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build ConnectMusics.

To integrate ConnectMusics into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'ConnectMusics'
end
```

Then, run the following command:

```bash
$ pod install
```

##Usage

###Intro

For Spotify you need to register your application to the API. You can get it by following the steps in this link https://developer.spotify.com/web-api/tutorial/.

###Spotify

####Authentication

Once you have your client id and client secret, in you viewController you do :

```Swift
ConnectMusics.sharedInstance.initProvider(provider: .spotify, clientID: yourClientID, clientSecret: yourClientSecret, redirectURI: yourRedirectURI)
```
Then in your appDelegate you need to create a function open url :

```Swift
func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        (ConnectMusics.sharedInstance.getInstance().getProvider(wantedProvider: .spotify) as! CMSpotifyProviderManager).login(withAuthenticationCode: url.absoluteString)
        return true
    }
```

####Playlists

You can retrieve your current user playlists, you will receive the followed and the created by this user.

```Swift
var providerPlaylists:[CMPlaylist] = []
func viewDidLoad() {
        super.viewDidLoad()
        let spotify = ConnectMusics.sharedInstance.getInstance().getProvider(wantedProvider: .spotify)
        spotify?.getPlaylists(completionHandler: { (error :  String?) in
            if error == nil {
               self.providerPlaylists =  ConnectMusics.sharedInstance.getInstance().getPlaylistsByProviderType(providerType: .spotify)!
            }

        })
    }
```

You will get a list of Playlists. The object playlist contain the following :
- name
- id
- owner
- is_public
- tracks (which is a list of CMSpotifyTracks)

####Tracks

Its similar to playlists but you need your playlist ID and your user ID.

```Swift
var currentPlaylist:CMPlaylist?
var providerTracks : [CMSpotifyTrack] = []

func viewDidLoad() {
        super.viewDidLoad()
        let spotify = ConnectMusics.sharedInstance.getInstance().getProvider(wantedProvider: .spotify) as! CMSpotifyProviderManager
        spotify.getMe { (error:String?) in
            spotify.getTracks(playlistToUpdate: self.currentPlaylist!, completionHandler: { (playlistUpdated : CMPlaylist?, error: String?) in
                if error == nil {
                    self.providerTracks = (playlistUpdated?.mediaItem as! CMSpotifyPlaylist).tracks
                }
            })
        }
    }
```

The object Track contain the following :
- albumName
- albumUrl
- albumId
- albumImage
- url
- id
- name

###Apple Music

###Playlists subscribed

You can retrieve your Playlists like this :

```Swift
var providerPlaylists:[CMPlaylist] = []
func viewDidLoad() {
        super.viewDidLoad()
        let appleMusic = ConnectMusics.sharedInstance.getInstance().getProvider(wantedProvider: .appleMusic)
        appleMusic?.getPlaylists(completionHandler: { (error :  String?) in
            if error == nil {
               self.providerPlaylists =  ConnectMusics.sharedInstance.getInstance().getPlaylistsByProviderType(providerType: .appleMusic)!
            }

        })
    }
```

The object Playlist contain the following :
- name
- mediaItem (convert this to MPMediaPlaylist and import MediaPlayer)
- providerType

##Credits


ConnectMusics is created by Shemana and Keenaa you can follow our other projects here :
- https://github.com/shemana
- https://github.com/Keenaa

##License

ConnectMusics is released under the Apache license. See LICENSE for details.
