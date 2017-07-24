import Foundation

class UtilsContextBridge {
    static var get: UtilsContextProtcol.Type = UtilsContext.self
}

protocol UtilsContextProtcol {
    static var flowUtils: FlowUtilsProtocol.Type { get }
}

class UtilsContext: UtilsContextProtcol {
    static var flowUtils: FlowUtilsProtocol.Type { return FlowUtils.self }
}
