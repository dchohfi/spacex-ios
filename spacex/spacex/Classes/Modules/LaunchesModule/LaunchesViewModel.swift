import ModuleArchitecture
import DataManager

struct LaunchViewModel {
    let titleLabel: String
    let launch: Launch
    init(launch: Launch) {
        self.launch = launch
        self.titleLabel = launch.details ?? ""
    }
}

struct LaunchesViewModel: ViewModel {
    let viewModels: [LaunchViewModel]

    init() {
        self.viewModels = []
    }

    init(launches: [Launch]) {
        self.viewModels = launches.map(LaunchViewModel.init)
    }
}
