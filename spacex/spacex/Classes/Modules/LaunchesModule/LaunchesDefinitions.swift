import ModuleArchitecture
import DataManager

protocol LaunchesModuleType: Module {
    func build() -> LaunchesRouterType
}

protocol LaunchesRouterType: Router {
    var viewController: LaunchesViewControllerType { get }
    
    func showLaunchDetails(for launch: Launch)
}

protocol LaunchesPresenterType: Presenter, LaunchesViewControllerDelegate {
    var listener: LaunchesListenter? { get set }
}

protocol LaunchesViewControllerType: ViewControllerType {
    var delegate: LaunchesViewControllerDelegate? { get set }
}

protocol LaunchesView: View where ViewModelType == LaunchesViewModel {
    
}
