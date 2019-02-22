import ModuleArchitecture
import DataManager

final class LaunchListCoordinator: Coordinator<LaunchListPresenterType>, LaunchListCoordinatorType {

    let viewController: LaunchListViewControllerType

    private let launchDetailsModule: LaunchDetailsModuleType

    private var currentChild: CoordinatorType?

    init(presenter: LaunchListPresenterType,
         viewController: LaunchListViewControllerType,
         launchDetailsModule: LaunchDetailsModuleType) {

        self.viewController = viewController
        self.launchDetailsModule = launchDetailsModule
        super.init(presenter: presenter)
    }

    func showLaunchDetails(for launch: Launch) {

        let launchDetailsCoordinator = self.launchDetailsModule.createCoordinator(with: launch, delegate: self)
        self.currentChild = launchDetailsCoordinator

        let viewController = launchDetailsCoordinator.viewController.asViewController()
        let navigationController = self.viewController.asViewController().navigationController
        navigationController?.pushViewController(viewController, animated: true)

        launchDetailsCoordinator.start()
    }
}

extension LaunchListCoordinator: LaunchListPresenterDelegate {

    func didSelect(launch: Launch) {

        self.showLaunchDetails(for: launch)
    }
}

extension LaunchListCoordinator: LaunchDetailsCoordinatorDelegate {

    func viewDidDisappear() {

        self.currentChild = nil
    }
}
