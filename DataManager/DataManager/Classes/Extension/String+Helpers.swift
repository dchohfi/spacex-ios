extension String {
    public func mapOrFail() -> URL {
        guard let url = URL(string: self) else {
            fatalError("Invalid URL: \(self)")
        }
        return url
    }
}
