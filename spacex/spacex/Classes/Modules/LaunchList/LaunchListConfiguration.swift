import ModuleArchitecture
import DataManager

struct LaunchListConfiguration {

    let launches: [LaunchConfiguration]

    init() {
        self.launches = []
    }

    init(launches: [Launch]) {
        
        self.launches = launches.map(LaunchConfiguration.init)
    }
}

struct LaunchConfiguration {

    let titleLabel: String
    let launch: Launch

    init(launch: Launch) {

        self.launch = launch
        self.titleLabel = launch.details ?? ""
    }
}
