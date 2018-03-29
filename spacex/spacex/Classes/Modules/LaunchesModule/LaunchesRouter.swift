import ModuleArchitecture

final class LaunchesRouter: LaunchesRouterType {
    private let presenter: LaunchesPresenterType
    let viewController: LaunchesViewControllerType

    private(set) var currentChield: Router?
    
    init(presenter: LaunchesPresenterType, viewController: LaunchesViewControllerType) {
        self.presenter = presenter
        self.viewController = viewController
    }
    
    func start() {
        self.presenter.start()
    }
    
    func stop() {
        self.presenter.stop()
    }
}
