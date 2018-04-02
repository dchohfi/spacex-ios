import ModuleArchitecture
import DataManager

final class AppRouter: AppRouterType {
    private let window: UIWindow

    private let launchesModule: LaunchesModuleType

    private(set) var currentChield: Router?
    
    init(window: UIWindow, launchesModule: LaunchesModuleType) {
        self.window = window
        self.launchesModule = launchesModule
    }
    
    func start() {
        let launchesRouter = self.launchesModule.buildWith(listener: self)
        self.currentChield = launchesRouter

        let viewController = launchesRouter.viewController.asViewController()
        self.window.rootViewController = UINavigationController(rootViewController: viewController)
        self.window.makeKeyAndVisible()

        launchesRouter.start()
    }
    
    func stop() {
    }
}

extension AppRouter: LaunchesListenter {
    func didSelect(launch: Launch) {
        
    }
}
