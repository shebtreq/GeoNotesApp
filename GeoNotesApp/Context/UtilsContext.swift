import Foundation

class UtilsContext {
    
    static let instance = UtilsContext()
    
    private init() {}
    
    var routerUtils: RouterUtilsProtocol.Type { return RouterUtils.self }
}
