import Foundation

protocol ConfigurationProtocol {
    static func configure()
}

class ConfiguarationsContainer: ConfigurationProtocol {
    
    private static var instance = ConfiguarationsContainer()
    
    private var configurations: [ConfigurationProtocol.Type] = [
        NetworkConfiguration.self
    ]
    
    private init() {
        configurations.forEach({$0.configure()})
    }
    
    static func configure() {
        _ = instance
    }
}
