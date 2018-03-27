import Moya

enum SpaceXTarget {
    case lastest
    case all
}

extension SpaceXTarget: TargetType {
    var baseURL: URL { return "https://api.spacexdata.com/v2/".mapOrFail() }

    var path: String {
        switch self {
        case .all:
            return "launches"
        case .lastest:
            return "launches/latest"
        }
    }

    var method: Moya.Method { return .get }

    var sampleData: Data { return Data() }

    var task: Task { return .requestPlain }

    var validationType: ValidationType { return .successCodes }

    var headers: [String: String]? { return [:] }

}
