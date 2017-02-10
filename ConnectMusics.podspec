Pod::Spec.new do |s|
s.name     = "ConnectMusics"
s.version  = "0.20.0"
s.summary  = "ConnectMusics is a framework which allow you to simply connect multiple music provider like Spotify and AppleMusic."
s.homepage  = "https://github.com/shemana/ConnectMusics/"
s.license   = { :type => "Apache-2.0" , :file => "LICENSE"}
s.authors    = {"Shemana" => "guillaume@chiebbouares.me",
                "Keena"  => "meryl2194@gmail.com"}
s.source = { :git => "https://github.com/shemana/ConnectMusics/", :tag => "v#{s.version}"}
s.ios.deployement_target = "9.0"
s.source_file = "ConnectMusics/*.{swift,h}"
s.requires_arc = true
