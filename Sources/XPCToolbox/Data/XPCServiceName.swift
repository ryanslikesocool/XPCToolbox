/// The name of an XPC service.
@frozen
public struct XPCServiceName: RawRepresentable {
	public typealias RawValue = String

	public let rawValue: RawValue

	public init(rawValue: RawValue) {
		self.rawValue = rawValue
	}
}

// MARK: - Sendable

extension XPCServiceName: Sendable { }

// MARK: - Equatable

extension XPCServiceName: Equatable { }

// MARK: - Hashable

extension XPCServiceName: Hashable { }

// MARK: - ServiceName

extension XPCServiceName: ServiceName { }
