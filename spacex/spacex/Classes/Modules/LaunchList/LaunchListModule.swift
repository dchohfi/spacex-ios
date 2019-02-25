import ModuleArchitecture
import DataManager

final class LaunchListModule: Module, LaunchListModuleType {

    private let launchDetailsModule: LaunchDetailsModuleType
    private let spaceXInteractor: SpaceXInteractorType

    init(launchDetailsModule: LaunchDetailsModuleType, spaceXInteractor: SpaceXInteractorType) {

        self.launchDetailsModule = launchDetailsModule
        self.spaceXInteractor = spaceXInteractor
    }

    func createCoordinator() -> LaunchListCoordinatorType {

        let presenter = LaunchListPresenter(spaceXInteractor: self.spaceXInteractor)
        let viewController = LaunchListViewController()
        let coordinator = LaunchListCoordinator(presenter: presenter,
                                                viewController: viewController,
                                                launchDetailsModule: self.launchDetailsModule)
        viewController.delegate = presenter
        presenter.viewController = viewController
        presenter.delegate = coordinator
        return coordinator
    }
}
