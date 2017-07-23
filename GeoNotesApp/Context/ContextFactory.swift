import Foundation

class ContextFactory {
    
    static let instance = ContextFactory()
    
    private init() {}
    
    var routerContext: RouterContextProtocol.Type = RouterContext.self
    var utilsContext: UtilsContextProtocol.Type = UtilsContext.self
    var interactorContext: InteractorContextProtocol.Type = InteractorContext.self
    var webServiceContext: WebServiceContextProtocol.Type = WebServiceContext.self
}
