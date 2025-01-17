/// The name of a Mach service.
@frozen
public struct MachServiceName: RawRepresentable {
	public typealias RawValue = String

	public let rawValue: RawValue

	public init(rawValue: RawValue) {
		self.rawValue = rawValue
	}
}

// MARK: - Sendable

extension MachServiceName: Sendable { }

// MARK: - Equatable

extension MachServiceName: Equatable { }

// MARK: - Hashable

extension MachServiceName: Hashable { }

// MARK: - ServiceName

extension MachServiceName: ServiceName { }
