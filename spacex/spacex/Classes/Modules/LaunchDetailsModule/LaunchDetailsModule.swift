import ModuleArchitecture
import DataManager

final class LaunchDetailsModule: LaunchDetailsModuleType {
    
    func build(withLaunch launch: Launch) -> LaunchDetailsRouterType {
        let presenter = LaunchDetailsPresenter<LaunchDetailsViewController>(launch: launch)
        let viewController = LaunchDetailsViewController()
        let router = LaunchDetailsRouter(presenter: presenter, viewController: viewController)
        viewController.delegate = presenter
        presenter.view = viewController
        presenter.router = router
        return router
    }
}
