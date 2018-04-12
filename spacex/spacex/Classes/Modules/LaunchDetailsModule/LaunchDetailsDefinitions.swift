import ModuleArchitecture
import DataManager

protocol LaunchDetailsModuleType: Module {
    func build(withLaunch launch: Launch) -> LaunchDetailsRouterType
}

protocol LaunchDetailsRouterType: Router {
    var viewController: LaunchDetailsViewControllerType { get }
}

protocol LaunchDetailsPresenterType: Presenter, LaunchDetailsViewControllerDelegate {
    var listener: LaunchDetailsListenter? { get set }
}

protocol LaunchDetailsViewControllerType: ViewControllerType {
    var delegate: LaunchDetailsViewControllerDelegate? { get set }
}

protocol LaunchDetailsView: View where ViewStateType == LaunchDetailsViewState {
    
}
