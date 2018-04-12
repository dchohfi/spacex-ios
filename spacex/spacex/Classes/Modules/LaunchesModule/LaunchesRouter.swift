import ModuleArchitecture
import DataManager

final class LaunchesRouter: LaunchesRouterType {
    private let presenter: LaunchesPresenterType
    let viewController: LaunchesViewControllerType

    // - MARK: Module Dependencies
    
    private let launchDetailsModule: LaunchDetailsModuleType

    private(set) var currentChield: Router?
    
    init(presenter: LaunchesPresenterType,
         viewController: LaunchesViewControllerType,
         launchDetailsModule: LaunchDetailsModuleType) {
        self.presenter = presenter
        self.viewController = viewController
        self.launchDetailsModule = launchDetailsModule
    }
    
    func start() {
        self.presenter.start()
    }
    
    func stop() {
        self.presenter.stop()
    }
}

extension LaunchesRouter {
    
    func showLaunchDetails(for launch: Launch) {
        let launchDetailsRouter = self.launchDetailsModule.build(withLaunch: launch)
        self.currentChield = launchDetailsRouter
        
        let viewController = launchDetailsRouter.viewController.asViewController()
        let navigationController = self.viewController.asViewController().navigationController
        navigationController?.pushViewController(viewController, animated: true)
        
        launchDetailsRouter.start()
        
    }
}
