import ModuleArchitecture

final class LaunchDetailsRouter: LaunchDetailsRouterType {
    private let presenter: LaunchDetailsPresenterType
    let viewController: LaunchDetailsViewControllerType
    
    private(set) var currentChield: Router?
    
    init(presenter: LaunchDetailsPresenterType, viewController: LaunchDetailsViewControllerType) {
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
