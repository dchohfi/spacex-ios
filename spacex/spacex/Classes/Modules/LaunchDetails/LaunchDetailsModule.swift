import ModuleArchitecture
import DataManager

final class LaunchDetailsModule: Module, LaunchDetailsModuleType {

    func createCoordinator(with launch: Launch, delegate: LaunchDetailsCoordinatorDelegate?) -> LaunchDetailsCoordinatorType {

        let presenter = LaunchDetailsPresenter(launch: launch)
        let viewController = LaunchDetailsViewController()
        let coordinator = LaunchDetailsCoordinator(presenter: presenter, viewController: viewController)
        coordinator.delegate = delegate
        viewController.delegate = presenter
        presenter.viewController = viewController
        presenter.delegate = coordinator
        return coordinator
    }
}
