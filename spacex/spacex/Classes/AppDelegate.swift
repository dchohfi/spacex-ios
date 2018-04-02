import UIKit
import DataManager
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let container: DataContainerType = DataContainer(plugins: [NetworkLoggerPlugin()])
    private var appRouter: AppRouterType?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let launchesModule = LaunchesModule(repository: container.resolve())
        let launchDetailsModule = LaunchDetailsModule()
        let appRouter = AppModule(window: window,
                                  launchesModule: launchesModule,
                                  launchDetailsModule: launchDetailsModule).build()
        self.appRouter = appRouter

        appRouter.start()

        return true
    }
}
