
Pod::Spec.new do |s|

  s.name         = "ConnectMusics"
  s.version      = "0.35.1"
  s.summary      = "ConnectMusics is a framework which allow you to simply connect multiple music provider like Spotify and AppleMusic"

  s.homepage     = "https://github.com/shemana/ConnectMusics"
  s.license      = { :type => "Apache-2.0" , :file => "LICENSE" }
  s.authors    = {"Shemana" => "guillaume@chiebbouares.me",
                  "Keena"  => "meryl2194@gmail.com"}

  s.ios.deployment_target = "9.3"
  s.source   = { :git => "https://github.com/shemana/ConnectMusics.git", :tag => "v#{s.version}" }
  s.source_files = "ConnectMusics/*.swift"
  s.requires_arc = true
  s.dependency "Alamofire", "~> 4.3"
  s.dependency "SwiftyJSON"

end
