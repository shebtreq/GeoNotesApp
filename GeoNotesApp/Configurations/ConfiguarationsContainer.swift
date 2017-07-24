import Foundation

protocol ConfigurationProtocol {
    static func configure()
}

class ConfiguarationsContainer  {
    
    private static var instance = ConfiguarationsContainer()
    
    private var configurations: [ConfigurationProtocol.Type] = [
        WebServiceConfiguration.self
    ]
    
    private init() {
        configurations.forEach({$0.configure()})
    }
    
    static func configure() {
        _ = ConfiguarationsContainer.instance
    }
}
