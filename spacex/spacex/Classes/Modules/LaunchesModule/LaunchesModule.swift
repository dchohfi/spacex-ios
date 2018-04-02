import ModuleArchitecture
import DataManager

final class LaunchesModule: LaunchesModuleType {

    private let repository: SpaceXRepositoryType

    init(repository: SpaceXRepositoryType) {
        self.repository = repository
    }

    func buildWith(listener: LaunchesListenter) -> LaunchesRouterType {
        let presenter = LaunchesPresenter<LaunchesViewController>(repository: self.repository)
        presenter.listener = listener
        let viewController = LaunchesViewController()
        let router = LaunchesRouter(presenter: presenter, viewController: viewController)
        viewController.delegate = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.listener = withListener
        return router
    }
}
