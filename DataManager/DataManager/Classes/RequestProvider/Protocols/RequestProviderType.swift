import RxSwift
import Moya

public protocol RequestProviderType {
    func request<Model: Decodable>(target: Moya.TargetType) -> Single<Model>
    func request(target: Moya.TargetType) -> Single<Response>
}

public extension RequestProviderType {
    func request<Model: Decodable>(_ type: Model.Type, target: Moya.TargetType) -> Single<Model> {
        return self.request(target: target)
    }
}
