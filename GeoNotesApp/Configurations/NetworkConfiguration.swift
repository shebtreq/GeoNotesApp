import Foundation

class NetworkConfiguration: ConfigurationProtocol {

    static func configure() {
        type(of: ContextFactory.instance.webServiceContext.network)
            .add(defaultHeaders: [
                (key: "key1", value: "value1"),
                (key: "key2", value: "value2")
            ])
    }
}
