import ModuleArchitecture
import DataManager

struct LaunchDetailsConfiguration {

    private let launch: Launch

    let detailsLabelText: String

    init(launch: Launch) {

        self.launch = launch
        self.detailsLabelText = launch.details ?? ""
    }
}
