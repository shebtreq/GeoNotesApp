import Foundation

class WebServiceConfiguration: ConfigurationProtocol {

    static func configure() {
        let networkClass = type(of: WebServiceContextBridge.get.network)
        networkClass.add(defaultHeaders: [
            (key: "key1", value: "value1"),
            (key: "key2", value: "value2")
        ])
        networkClass.set(baseUrl: "http://localhost:3000")
    }
}
