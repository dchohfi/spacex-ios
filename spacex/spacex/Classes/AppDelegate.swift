import UIKit
import DataManager
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let container: DataContainerType = DataContainer(plugins: [NetworkLoggerPlugin()])
    private var appCoordinator: AppCoordinatorType?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let launchDetailsModule = LaunchDetailsModule()
        let launchListModule = LaunchListModule(launchDetailsModule: launchDetailsModule,
                                                spaceXInteractor: container.resolve())
        
        let appCoordinator = AppModule(window: window,
                                       launchListModule: launchListModule).createCoordinator()
        appCoordinator.start()

        self.appCoordinator = appCoordinator

        return true
    }
}
