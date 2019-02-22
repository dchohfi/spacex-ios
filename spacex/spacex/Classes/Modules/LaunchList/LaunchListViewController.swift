import UIKit
import ModuleArchitecture

protocol LaunchListViewControllerDelegate: AnyObject {

    func didSelectLaunch(_ launch: LaunchConfiguration)
}

final class LaunchListViewController: UIViewController, LaunchListViewControllerType {

    weak var delegate: LaunchListViewControllerDelegate?
    private lazy var component: LaunchListComponent = {

        let component = LaunchListComponent()
        component.delegate = self
        return component
    }()

    override func loadView() {

        self.view = self.component
    }

    override func viewDidLoad() {

        super.viewDidLoad()
    }
}

extension LaunchListViewController: LaunchListPresenterView {

    // This is the communication point from presenter to view controller.
    // You can change the name for something more contextual if needed.
    func render(configuration: LaunchListConfiguration) {

        self.component.render(configuration: .build(configuration))
    }
}

extension LaunchListViewController: LaunchListComponentDelegate {

    func didSelectLaunch(_ launch: LaunchConfiguration) {

        self.delegate?.didSelectLaunch(launch)
    }
}
