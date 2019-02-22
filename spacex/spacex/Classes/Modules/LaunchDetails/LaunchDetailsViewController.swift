import UIKit
import ModuleArchitecture

protocol LaunchDetailsViewControllerDelegate: AnyObject {

    func viewDidDisappear()
}

final class LaunchDetailsViewController: UIViewController, LaunchDetailsViewControllerType {

    weak var delegate: LaunchDetailsViewControllerDelegate?
    private lazy var component = LaunchDetailsComponent()

    override func loadView() {

        self.view = self.component
    }

    override func viewDidDisappear(_ animated: Bool) {

        super.viewDidDisappear(animated)

        self.delegate?.viewDidDisappear()
    }
}

extension LaunchDetailsViewController: LaunchDetailsPresenterView {

    // This is the communication point from presenter to view controller.
    // You can change the name for something more contextual if needed.
    func render(configuration: LaunchDetailsConfiguration) {

        self.component.render(configuration: .build(configuration))
    }
}
