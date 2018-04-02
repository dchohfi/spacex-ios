import ModuleArchitecture

protocol LaunchesModuleType: Module {
    func buildWith(listener: LaunchesListenter) -> LaunchesRouterType
}

protocol LaunchesRouterType: Router {
    var viewController: LaunchesViewControllerType { get }
}

protocol LaunchesPresenterType: Presenter, LaunchesViewControllerDelegate {
    var listener: LaunchesListenter? { get set }
}

protocol LaunchesViewControllerType: ViewControllerType {
    var delegate: LaunchesViewControllerDelegate? { get set }
}

protocol LaunchesView: View where ViewModelType == LaunchesViewModel {
    
}
