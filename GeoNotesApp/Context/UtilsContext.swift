import Foundation

class UtilsContext {
    
    static let instance = UtilsContext()
    
    private init() {}
    
    var flowUtils: FlowUtilsProtocol.Type { return FlowUtils.self }
}
