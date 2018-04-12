import ModuleArchitecture
import DataManager

final class AppRouter: AppRouterType {
    private let window: UIWindow

    private let launchesModule: LaunchesModuleType

    private(set) var currentChild: Router?
    
    init(window: UIWindow,
         launchesModule: LaunchesModuleType) {
        self.window = window
        self.launchesModule = launchesModule
    }
    
    func start() {
        self.showLaunches()
    }
}

extension AppRouter {
    
    func showLaunches() {
        let launchesRouter = self.launchesModule.build()
        self.currentChild = launchesRouter
        
        let viewController = launchesRouter.viewController.asViewController()
        self.window.rootViewController = UINavigationController(rootViewController: viewController)
        self.window.makeKeyAndVisible()
        
        launchesRouter.start()
    }
}
