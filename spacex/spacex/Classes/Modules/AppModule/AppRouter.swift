import ModuleArchitecture
import DataManager

final class AppRouter: AppRouterType {
    private let window: UIWindow

    private let launchesModule: LaunchesModuleType

    private(set) var currentChield: Router?
    
    init(window: UIWindow,
         launchesModule: LaunchesModuleType) {
        self.window = window
        self.launchesModule = launchesModule
    }
    
    func start() {
        self.showLaunches()
    }
    
    func stop() {
    }
}

extension AppRouter {
    
    func showLaunches() {
        let launchesRouter = self.launchesModule.build()
        self.currentChield = launchesRouter
        
        let viewController = launchesRouter.viewController.asViewController()
        self.window.rootViewController = UINavigationController(rootViewController: viewController)
        self.window.makeKeyAndVisible()
        
        launchesRouter.start()
    }
}