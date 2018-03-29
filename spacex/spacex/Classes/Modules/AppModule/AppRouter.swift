import ModuleArchitecture
import DataManager

final class AppRouter: AppRouterType {
    private let window: UIWindow

    private let launchesRouter: LaunchesRouterType
    private(set) var children: [Router] = []
    
    init(window: UIWindow, launchesRouter: LaunchesRouterType) {
        self.window = window
        self.launchesRouter = launchesRouter
    }
    
    func start() {
        let viewController = self.launchesRouter.viewController.asViewController()
        self.window.rootViewController = UINavigationController(rootViewController: viewController)
        self.window.makeKeyAndVisible()

        self.children.append(self.launchesRouter)
        self.launchesRouter.start()
    }
    
    func stop() {
    }
}
