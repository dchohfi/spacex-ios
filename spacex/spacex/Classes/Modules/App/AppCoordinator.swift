import ModuleArchitecture

final class AppCoordinator: Coordinator<AppPresenterType>, AppCoordinatorType {

    private let window: UIWindow
    private let launchListModule: LaunchListModule

    private var currentChild: CoordinatorType?

    init(presenter: AppPresenterType, window: UIWindow, launchListModule: LaunchListModule) {

        self.window = window
        self.launchListModule = launchListModule
        super.init(presenter: presenter)
    }

    func showLaunchList() {

        let launchListCoordinator = self.launchListModule.createCoordinator()
        self.currentChild = launchListCoordinator

        let viewController = launchListCoordinator.viewController.asViewController()
        self.window.rootViewController = UINavigationController(rootViewController: viewController)
        self.window.makeKeyAndVisible()

        launchListCoordinator.start()
    }
}

extension AppCoordinator: AppPresenterDelegate {

    func didStart() {

        self.showLaunchList()
    }
}
