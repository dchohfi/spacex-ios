import ModuleArchitecture

protocol AppModuleType: Module {
    func build() -> AppRouterType
}

protocol AppRouterType: Router {
    
}
