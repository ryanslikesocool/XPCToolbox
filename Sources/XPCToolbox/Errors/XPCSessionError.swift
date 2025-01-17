enum XPCSessionError {
	case unexpectedConcreteServiceName(any ServiceName.Type)
}

// MARK: - Sendable

extension XPCSessionError: Sendable { }

// MARK: - Error

extension XPCSessionError: Error { }