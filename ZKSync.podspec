Pod::Spec.new do |s|
    s.name             = 'ZKSync'
    s.version          = '0.0.3'
    s.summary          = 'Swift SDK for zkSync'

    s.description      = <<-DESC
zkSync is a scaling and privacy engine for Ethereum. Its current functionality scope includes low gas transfers of ETH and ERC20 tokens in the Ethereum network.
    DESC

    s.homepage         = "https://github.com/zksync-sdk/zksync-swift"
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    
    s.author           = { "The Matter Labs team" => "hello@matterlabs.dev" }
  
    s.ios.deployment_target = "13.0"
    s.swift_version    = '5.5'
  
    s.source           = { :git => "https://github.com/zksync-sdk/zksync-swift.git", :tag => "#{s.version}" }
    
    s.dependency 'Alamofire', '~> 5.0'
    s.dependency 'web3swift'
    s.dependency 'PromiseKit'
    
    s.vendored_frameworks = "Dependencies/ZKSyncCrypto.xcframework"
    s.source_files = 'Sources/ZKSync/**/*'
end
