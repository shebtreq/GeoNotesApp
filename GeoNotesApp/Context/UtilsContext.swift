import Foundation

protocol UtilsContextProtocol {
    static var routerUtils: RouterUtilsProtocol.Type { get }
}

class UtilsContext: UtilsContextProtocol {
    static var routerUtils: RouterUtilsProtocol.Type { return RouterUtils.self }
}
