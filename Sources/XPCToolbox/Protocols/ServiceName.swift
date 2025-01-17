public protocol ServiceName: RawRepresentable where
	RawValue == String
{
	/// Creates a new instance with the specified raw value.
	///
	/// - Parameter rawValue: The raw value to use for the new instance.
	// Shadows ``RawRepresentable.init?(rawValue:)``
	init(rawValue: RawValue)
}

// MARK: - Intrinsic

public extension ServiceName {
	/// Creates a new instance with the specified raw value.
	///
	/// - Remark: This initializer is functionally equivalent to ``init(rawValue:)``
	///
	/// - Parameter rawValue: The raw value to use for the new instance.
	init(_ rawValue: RawValue) {
		self.init(rawValue: rawValue)
	}
}