public protocol DataContainerType {
    
    func resolve<T>() -> T
    func resolve<T, Specifier>(_ specifier: Specifier) -> T
}
