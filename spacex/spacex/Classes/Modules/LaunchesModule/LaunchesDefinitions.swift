import ModuleArchitecture

protocol LaunchesModuleType: Module {
    func build(withListener: LaunchesListenter) -> LaunchesRouterType
}

protocol LaunchesRouterType: Router {
    var viewController: LaunchesViewControllerType { get }
}

protocol LaunchesPresenterType: Presenter, LaunchesViewControllerDelegate {
    weak var listener: LaunchesListenter? { get set }
}

protocol LaunchesViewControllerType: ViewControllerType {
    weak var delegate: LaunchesViewControllerDelegate? { get set }
}

protocol LaunchesView: View where ViewModelType == LaunchesViewModel {
    
}
