import ModuleArchitecture
import DataManager

protocol LaunchDetailsListenter: class {
    
}

final class LaunchDetailsPresenter<View: LaunchDetailsView>: LaunchDetailsPresenterType {
    weak var listener: LaunchDetailsListenter?
    weak var view: View?
    weak var router: LaunchDetailsRouterType?
    
    private var launch: Launch
    
    init(launch: Launch) {
        self.launch = launch
    }
    
    func start() {
        let viewState = LaunchDetailsViewState(titleLabel: self.launch.details ?? "")
        self.view?.render(viewState: viewState)
    }
}

extension LaunchDetailsPresenter: LaunchDetailsViewControllerDelegate {
    
}
