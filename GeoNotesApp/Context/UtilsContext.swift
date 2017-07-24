import Foundation

class UtilsContextBridge {
    static var get: UtilsContextProtcol.Type = UtilsContext.self
}

protocol UtilsContextProtcol {
    static var viewUtils: ViewUtilsProtocol.Type { get }
}

class UtilsContext: UtilsContextProtcol {
    static var viewUtils: ViewUtilsProtocol.Type { return ViewUtils.self }
}
