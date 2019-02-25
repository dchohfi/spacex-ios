import ModuleArchitecture
import DataManager

// Builder object that configures the module and returns a coordinator.
// A module should always be instantiated via the createCoordinator method.
protocol LaunchDetailsModuleType: ModuleType {

    func createCoordinator(with launch: Launch, delegate: LaunchDetailsCoordinatorDelegate?) -> LaunchDetailsCoordinatorType
}

protocol LaunchDetailsCoordinatorType: CoordinatorType {

    var viewController: LaunchDetailsViewControllerType { get }
}

protocol LaunchDetailsPresenterType: PresenterType {

    var delegate: LaunchDetailsPresenterDelegate? { get set }
}

protocol LaunchDetailsViewControllerType: ViewControllerType {

    var delegate: LaunchDetailsViewControllerDelegate? { get set }
}

protocol LaunchDetailsPresenterView: AnyObject {

    // This is the communication point from presenter to view controller.
    // You can change the name for something more contextual if needed.
    func render(configuration: LaunchDetailsConfiguration)
}
