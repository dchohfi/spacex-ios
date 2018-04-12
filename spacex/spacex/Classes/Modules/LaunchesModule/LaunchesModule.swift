import ModuleArchitecture
import DataManager

final class LaunchesModule: LaunchesModuleType {

    private let repository: SpaceXRepositoryType
    private let launchDetailsModule: LaunchDetailsModuleType

    init(repository: SpaceXRepositoryType, launchDetailsModule: LaunchDetailsModuleType) {
        self.repository = repository
        self.launchDetailsModule = launchDetailsModule
    }

    func build() -> LaunchesRouterType {
        let presenter = LaunchesPresenter<LaunchesViewController>(repository: self.repository)
        let viewController = LaunchesViewController()
        let router = LaunchesRouter(presenter: presenter,
                                    viewController: viewController,
                                    launchDetailsModule: self.launchDetailsModule)
        viewController.delegate = presenter
        presenter.view = viewController
        presenter.router = router
        return router
    }
}
