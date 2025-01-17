@preconcurrency import XPC

// MARK: - init

@available(macCatalyst 17.4, macOS 14, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public extension XPCSession {
	// MARK: some ServiceName

	/// Establishes a connection to an XPC service with the name and decodable message handler you specify.
	///
	/// If the service isn’t found or is unavailable, the connection fails and this method throws an error.
	///
	/// By default, this method activates the session it creates and the session is ready to accept messages.
	/// To create an inactive session, specify
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpcsession/initializationoptions/4169420-inactive )
	/// in the options parameter.
	///
	/// - Parameters:
	///   - service: The name of the Mach service or XPC service to connect to.
	///   If using a Mach service, the service name must exist in the Mach bootstrap accessible to the process and advertised in a `launchd.plist`.
	///   - targetQueue: The dispatch queue to use for session events.
	///   You can specify a concurrent dispatch queue.
	///   If you specify `nil`, the session uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Attributes the session uses when establishing the connection.
	///   - incomingMessageHandler: A closure the system calls when a client initiates a connection to the server.
	///   - cancellationHandler: A closure the system calls when it cancels a session.
	convenience init<Message>(
		service: some ServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCSession.InitializationOptions = .none,
		incomingMessageHandler: ((Message) -> (any Encodable)?)? = nil,
		cancellationHandler: ((XPCRichError) -> Void)? = nil
	) throws where
		Message: Decodable
	{
//		let initializer: (String, DispatchQueue?, XPCSession.InitializationOptions, ((Message) -> (any Encodable)?)?, ((XPCRichError) -> Void)?) throws -> XPCSession
//		initializer = switch service {
//			case let xpcService as XPCServiceName:
//				Self.init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)
//			case let machService as MachServiceName:
//				Self.init(machService:targetQueue:options:incomingMessageHandler:cancellationHandler:)
//			default:
//				throw XPCSessionError.unexpectedConcreteServiceName(type(of: service))
//		}
//		self = initializer(service.rawValue, targetQueue, options, incomingMessageHandler, cancellationHandler)

		switch service {
			case let xpcService as XPCServiceName:
				try self.init(
					xpcService: xpcService,
					targetQueue: targetQueue,
					options: options,
					incomingMessageHandler: incomingMessageHandler,
					cancellationHandler: cancellationHandler
				)
			case let machService as MachServiceName:
				try self.init(
					machService: machService,
					targetQueue: targetQueue,
					options: options,
					incomingMessageHandler: incomingMessageHandler,
					cancellationHandler: cancellationHandler
				)
			default:
				throw XPCSessionError.unexpectedConcreteServiceName(type(of: service))
		}
	}

	/// Establishes a connection to an XPC service with the name and received message handler you specify.
	///
	/// If the service isn’t found or is unavailable, the connection fails and this method throws an error.
	///
	/// By default, this method activates the session it creates and the session is ready to accept messages.
	/// To create an inactive session, specify
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpcsession/initializationoptions/4169420-inactive )
	/// in the options parameter.
	///
	/// - Parameters:
	///   - service: The name of the Mach service or XPC service to connect to.
	///   If using a Mach service, the service name must exist in the Mach bootstrap accessible to the process and advertised in a `launchd.plist`.
	///   - targetQueue: The dispatch queue to use for session events.
	///   You can specify a concurrent dispatch queue.
	///   If you specify `nil`, the session uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Attributes the session uses when establishing the connection.
	///   - incomingMessageHandler: A closure the system calls when a client initiates a connection to the server.
	///   - cancellationHandler: A closure the system calls when it cancels a session.
	convenience init(
		service: some ServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCSession.InitializationOptions = .none,
		incomingMessageHandler: ((XPCReceivedMessage) -> (any Encodable)?)? = nil,
		cancellationHandler: ((XPCRichError) -> Void)? = nil
	) throws {
//		let initializer: (String, DispatchQueue?, XPCSession.InitializationOptions, ((XPCReceivedMessage) -> (any Encodable)?)?, ((XPCRichError) -> Void)?) throws -> XPCSession
//		initializer = switch service {
//			case let xpcService as XPCServiceName:
//				Self.init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)
//			case let machService as MachServiceName:
//				Self.init(machService:targetQueue:options:incomingMessageHandler:cancellationHandler:)
//			default:
//				throw XPCSessionError.unexpectedConcreteServiceName(type(of: service))
//		}
//		self = initializer(service.rawValue, targetQueue, options, incomingMessageHandler, cancellationHandler)

		switch service {
			case let xpcService as XPCServiceName:
				try self.init(
					xpcService: xpcService,
					targetQueue: targetQueue,
					options: options,
					incomingMessageHandler: incomingMessageHandler,
					cancellationHandler: cancellationHandler
				)
			case let machService as MachServiceName:
				try self.init(
					machService: machService,
					targetQueue: targetQueue,
					options: options,
					incomingMessageHandler: incomingMessageHandler,
					cancellationHandler: cancellationHandler
				)
			default:
				throw XPCSessionError.unexpectedConcreteServiceName(type(of: service))
		}
	}

	/// Establishes a connection to an XPC service with the name and dictionary message handler you specify.
	///
	/// If the service isn’t found or is unavailable, the connection fails and this method throws an error.
	///
	/// By default, this method activates the session it creates and the session is ready to accept messages.
	/// To create an inactive session, specify
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpcsession/initializationoptions/4169420-inactive )
	/// in the options parameter.
	///
	/// - Parameters:
	///   - service: The name of the Mach service or XPC service to connect to.
	///   If using a Mach service, the service name must exist in the Mach bootstrap accessible to the process and advertised in a `launchd.plist`.
	///   - targetQueue: The dispatch queue to use for session events.
	///   You can specify a concurrent dispatch queue.
	///   If you specify `nil`, the session uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Attributes the session uses when establishing the connection.
	///   - incomingMessageHandler: A closure the system calls when a client initiates a connection to the server.
	///   - cancellationHandler: A closure the system calls when it cancels a session.
	convenience init(
		service: some ServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCSession.InitializationOptions = .none,
		incomingMessageHandler: ((XPCDictionary) -> XPCDictionary?)? = nil,
		cancellationHandler: ((XPCRichError) -> Void)? = nil
	) throws {
//		let initializer: (String, DispatchQueue?, XPCSession.InitializationOptions, ((XPCDictionary) -> XPCDictionary?)?, ((XPCRichError) -> Void)?) throws -> XPCSession
//		initializer = switch service {
//			case let xpcService as XPCServiceName:
//				Self.init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)
//			case let machService as MachServiceName:
//				Self.init(machService:targetQueue:options:incomingMessageHandler:cancellationHandler:)
//			default:
//				throw XPCSessionError.unexpectedConcreteServiceName(type(of: service))
//		}
//		self = initializer(service.rawValue, targetQueue, options, incomingMessageHandler, cancellationHandler)

		switch service {
			case let xpcService as XPCServiceName:
				try self.init(
					xpcService: xpcService,
					targetQueue: targetQueue,
					options: options,
					incomingMessageHandler: incomingMessageHandler,
					cancellationHandler: cancellationHandler
				)
			case let machService as MachServiceName:
				try self.init(
					machService: machService,
					targetQueue: targetQueue,
					options: options,
					incomingMessageHandler: incomingMessageHandler,
					cancellationHandler: cancellationHandler
				)
			default:
				throw XPCSessionError.unexpectedConcreteServiceName(type(of: service))
		}
	}

	/// Establishes a connection to an XPC service with the name you specify.
	///
	/// If the service isn’t found or is unavailable, the connection fails and this method throws an error.
	///
	/// By default, this method activates the session it creates and the session is ready to accept messages.
	/// To create an inactive session, specify
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpcsession/initializationoptions/4169420-inactive )
	/// in the options parameter.
	///
	/// - Parameters:
	///   - service: The name of the Mach service or XPC service to connect to.
	///   If using a Mach service, the service name must exist in the Mach bootstrap accessible to the process and advertised in a `launchd.plist`.
	///   - targetQueue: The dispatch queue to use for session events.
	///   You can specify a concurrent dispatch queue.
	///   If you specify `nil`, the session uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Attributes the session uses when establishing the connection.
	///   - cancellationHandler: A closure the system calls when it cancels a session.
	convenience init(
		service: some ServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCSession.InitializationOptions = .none,
		cancellationHandler: ((XPCRichError) -> Void)? = nil
	) throws {
//		let initializer: (String, DispatchQueue?, XPCSession.InitializationOptions, ((XPCRichError) -> Void)?) throws -> XPCSession
//		initializer = switch service {
//			case let xpcService as XPCServiceName:
//				Self.init(xpcService:targetQueue:options:cancellationHandler:)
//			case let machService as MachServiceName:
//				Self.init(machService:targetQueue:options:cancellationHandler:)
//			default:
//				throw XPCSessionError.unexpectedConcreteServiceName(type(of: service))
//		}
//		self = initializer(service.rawValue, targetQueue, options, cancellationHandler)

		switch service {
			case let xpcService as XPCServiceName:
				try self.init(
					xpcService: xpcService,
					targetQueue: targetQueue,
					options: options,
					cancellationHandler: cancellationHandler
				)
			case let machService as MachServiceName:
				try self.init(
					machService: machService,
					targetQueue: targetQueue,
					options: options,
					cancellationHandler: cancellationHandler
				)
			default:
				throw XPCSessionError.unexpectedConcreteServiceName(type(of: service))
		}
	}

	// MARK: XPCServiceName

	/// Establishes a connection to an XPC service with the name and decodable message handler you specify.
	///
	/// If the service isn’t found or is unavailable, the connection fails and this method throws an error.
	///
	/// By default, this method activates the session it creates and the session is ready to accept messages.
	/// To create an inactive session, specify
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpcsession/initializationoptions/4169420-inactive )
	/// in the options parameter.
	///
	/// - Parameters:
	///   - xpcService: The name of the XPC service to connect to.
	///   - targetQueue: The dispatch queue to use for session events.
	///   You can specify a concurrent dispatch queue.
	///   If you specify `nil`, the session uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Attributes the session uses when establishing the connection.
	///   - incomingMessageHandler: A closure the system calls when a client initiates a connection to the server.
	///   - cancellationHandler: A closure the system calls when it cancels a session.
	convenience init<Message>(
		xpcService: borrowing XPCServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCSession.InitializationOptions = .none,
		incomingMessageHandler: ((Message) -> (any Encodable)?)? = nil,
		cancellationHandler: ((XPCRichError) -> Void)? = nil
	) throws where
		Message: Decodable
	{
		try self.init(
			xpcService: xpcService.rawValue,
			targetQueue: targetQueue,
			options: options,
			incomingMessageHandler: incomingMessageHandler,
			cancellationHandler: cancellationHandler
		)
	}

	/// Establishes a connection to an XPC service with the name and received message handler you specify.
	///
	/// If the service isn’t found or is unavailable, the connection fails and this method throws an error.
	///
	/// By default, this method activates the session it creates and the session is ready to accept messages.
	/// To create an inactive session, specify
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpcsession/initializationoptions/4169420-inactive )
	/// in the options parameter.
	///
	/// - Parameters:
	///   - xpcService: The name of the XPC service to connect to.
	///   - targetQueue: The dispatch queue to use for session events.
	///   You can specify a concurrent dispatch queue.
	///   If you specify `nil`, the session uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Attributes the session uses when establishing the connection.
	///   - incomingMessageHandler: A closure the system calls when a client initiates a connection to the server.
	///   - cancellationHandler: A closure the system calls when it cancels a session.
	convenience init(
		xpcService: borrowing XPCServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCSession.InitializationOptions = .none,
		incomingMessageHandler: ((XPCReceivedMessage) -> (any Encodable)?)? = nil,
		cancellationHandler: ((XPCRichError) -> Void)? = nil
	) throws {
		try self.init(
			xpcService: xpcService.rawValue,
			targetQueue: targetQueue,
			options: options,
			incomingMessageHandler: incomingMessageHandler,
			cancellationHandler: cancellationHandler
		)
	}

	/// Establishes a connection to an XPC service with the name and dictionary message handler you specify.
	///
	/// If the service isn’t found or is unavailable, the connection fails and this method throws an error.
	///
	/// By default, this method activates the session it creates and the session is ready to accept messages.
	/// To create an inactive session, specify
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpcsession/initializationoptions/4169420-inactive )
	/// in the options parameter.
	///
	/// - Parameters:
	///   - xpcService: The name of the XPC service to connect to.
	///   - targetQueue: The dispatch queue to use for session events.
	///   You can specify a concurrent dispatch queue.
	///   If you specify `nil`, the session uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Attributes the session uses when establishing the connection.
	///   - incomingMessageHandler: A closure the system calls when a client initiates a connection to the server.
	///   - cancellationHandler: A closure the system calls when it cancels a session.
	convenience init(
		xpcService: borrowing XPCServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCSession.InitializationOptions = .none,
		incomingMessageHandler: ((XPCDictionary) -> XPCDictionary?)? = nil,
		cancellationHandler: ((XPCRichError) -> Void)? = nil
	) throws {
		try self.init(
			xpcService: xpcService.rawValue,
			targetQueue: targetQueue,
			options: options,
			incomingMessageHandler: incomingMessageHandler,
			cancellationHandler: cancellationHandler
		)
	}

	/// Establishes a connection to an XPC service with the name you specify.
	///
	/// If the service isn’t found or is unavailable, the connection fails and this method throws an error.
	///
	/// By default, this method activates the session it creates and the session is ready to accept messages.
	/// To create an inactive session, specify
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpcsession/initializationoptions/4169420-inactive )
	/// in the options parameter.
	///
	/// - Parameters:
	///   - xpcService: The name of the XPC service to connect to.
	///   - targetQueue: The dispatch queue to use for session events.
	///   You can specify a concurrent dispatch queue.
	///   If you specify `nil`, the session uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Attributes the session uses when establishing the connection.
	///   - cancellationHandler: A closure the system calls when it cancels a session.
	convenience init(
		xpcService: borrowing XPCServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCSession.InitializationOptions = .none,
		cancellationHandler: ((XPCRichError) -> Void)? = nil
	) throws {
		try self.init(
			xpcService: xpcService.rawValue,
			targetQueue: targetQueue,
			options: options,
			cancellationHandler: cancellationHandler
		)
	}

	// MARK: MachServiceName

	/// Establishes a connection to a launch agent or launch daemon with the name and decodable message handler you specify.
	///
	/// If the service isn’t found or is unavailable, the connection fails and this method throws an error.
	///
	/// By default, this method activates the session it creates and the session is ready to accept messages.
	/// To create an inactive session, specify
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpcsession/initializationoptions/4169420-inactive )
	/// in the options parameter.
	///
	/// - Parameters:
	///   - machService: The name of the Mach service to connect to.
	///   The service name must exist in the Mach bootstrap accessible to the process and advertised in a `launchd.plist`.
	///   - targetQueue: The dispatch queue to use for session events.
	///   You can specify a concurrent dispatch queue.
	///   If you specify `nil`, the session uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Attributes the session uses when establishing the connection.
	///   - incomingMessageHandler: A closure the system calls when a client initiates a connection to the server.
	///   - cancellationHandler: A closure the system calls when it cancels a session.
	convenience init<Message>(
		machService: borrowing MachServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCSession.InitializationOptions = .none,
		incomingMessageHandler: ((Message) -> (any Encodable)?)? = nil,
		cancellationHandler: ((XPCRichError) -> Void)? = nil
	) throws where
		Message: Decodable
	{
		try self.init(
			machService: machService.rawValue,
			targetQueue: targetQueue,
			options: options,
			incomingMessageHandler: incomingMessageHandler,
			cancellationHandler: cancellationHandler
		)
	}

	/// Establishes a connection to a launch agent or launch daemon with the name and received message handler you specify.
	///
	/// If the service isn’t found or is unavailable, the connection fails and this method throws an error.
	///
	/// By default, this method activates the session it creates and the session is ready to accept messages.
	/// To create an inactive session, specify
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpcsession/initializationoptions/4169420-inactive )
	/// in the options parameter.
	///
	/// - Parameters:
	///   - machService: The name of the Mach service to connect to.
	///   The service name must exist in the Mach bootstrap accessible to the process and advertised in a `launchd.plist`.
	///   - targetQueue: The dispatch queue to use for session events.
	///   You can specify a concurrent dispatch queue.
	///   If you specify `nil`, the session uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Attributes the session uses when establishing the connection.
	///   - incomingMessageHandler: A closure the system calls when a client initiates a connection to the server.
	///   - cancellationHandler: A closure the system calls when it cancels a session.
	convenience init(
		machService: borrowing MachServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCSession.InitializationOptions = .none,
		incomingMessageHandler: ((XPCReceivedMessage) -> (any Encodable)?)? = nil,
		cancellationHandler: ((XPCRichError) -> Void)? = nil
	) throws {
		try self.init(
			machService: machService.rawValue,
			targetQueue: targetQueue,
			options: options,
			incomingMessageHandler: incomingMessageHandler,
			cancellationHandler: cancellationHandler
		)
	}

	/// Establishes a connection to a launch agent or launch daemon with the name and dictionary message handler you specify.
	///
	/// If the service isn’t found or is unavailable, the connection fails and this method throws an error.
	///
	/// By default, this method activates the session it creates and the session is ready to accept messages.
	/// To create an inactive session, specify
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpcsession/initializationoptions/4169420-inactive )
	/// in the options parameter.
	///
	/// - Parameters:
	///   - machService: The name of the Mach service to connect to.
	///   The service name must exist in the Mach bootstrap accessible to the process and advertised in a `launchd.plist`.
	///   - targetQueue: The dispatch queue to use for session events.
	///   You can specify a concurrent dispatch queue.
	///   If you specify `nil`, the session uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Attributes the session uses when establishing the connection.
	///   - incomingMessageHandler: A closure the system calls when a client initiates a connection to the server.
	///   - cancellationHandler: A closure the system calls when it cancels a session.
	convenience init(
		machService: borrowing MachServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCSession.InitializationOptions = .none,
		incomingMessageHandler: ((XPCDictionary) -> XPCDictionary?)? = nil,
		cancellationHandler: ((XPCRichError) -> Void)? = nil
	) throws {
		try self.init(
			machService: machService.rawValue,
			targetQueue: targetQueue,
			options: options,
			incomingMessageHandler: incomingMessageHandler,
			cancellationHandler: cancellationHandler
		)
	}

	/// Establishes a connection to a launch agent or launch daemon with the name you specify.
	///
	/// If the service isn’t found or is unavailable, the connection fails and this method throws an error.
	///
	/// By default, this method activates the session it creates and the session is ready to accept messages.
	/// To create an inactive session, specify
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpcsession/initializationoptions/4169420-inactive )
	/// in the options parameter.
	///
	/// - Parameters:
	///   - machService: The name of the Mach service to connect to.
	///   The service name must exist in the Mach bootstrap accessible to the process and advertised in a `launchd.plist`.
	///   - targetQueue: The dispatch queue to use for session events.
	///   You can specify a concurrent dispatch queue.
	///   If you specify `nil`, the session uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Attributes the session uses when establishing the connection.
	///   - cancellationHandler: A closure the system calls when it cancels a session.
	convenience init(
		machService: borrowing MachServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCSession.InitializationOptions = .none,
		cancellationHandler: ((XPCRichError) -> Void)? = nil
	) throws {
		try self.init(
			machService: machService.rawValue,
			targetQueue: targetQueue,
			options: options,
			cancellationHandler: cancellationHandler
		)
	}
}

// MARK: - sendSync

@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, watchOS 10, *)
public extension XPCSession {
	/// Sends a message over the session to the destination service, blocking the caller until receiving an encodable reply message.
	///
	/// This method supports priority inversion avoidance.
	/// Use this method instead of calling
	/// [`send(message:replyHandler:)`]( https://developer.apple.com/documentation/xpc/xpcsession/4169462-send )
	/// and using a semaphore.
	///
	/// Be judicious about your use of this API.
	/// It can block indefinitely.
	/// Calling this method while the session’s target queue is blocked may lead to deadlocks in certain scenarios.
	/// For that reason, invoking this method from the session’s target queue results in a crash.
	///
	/// - Tip: If you provide an API that uses this method, consider allowing callers to specify a queue and callback handler to let you provide results asynchronously.
	///
	/// Sessions send messages serially in a first-in, first-out (FIFO) order.
	/// This method is safe to call from multiple dispatch queues.
	/// The session can’t indicate whether the message *delivery* is successful or not.
	/// While the session may successfully enqueue the message at the remote end of the connection, there’s no guarantee about when the destination dequeues the message and invokes the receiving session’s handler.
	///
	/// - Important: If you create an inactive session, you must activate it before sending messages.
	/// Calling this method with an inactive session crashes.
	///
	/// - Returns: If successful, the response to the message; otherwise this method throws an error.
	func sendSync<Reply>() throws -> Reply where
		Reply: Decodable
	{
		let message: UInt8 = UInt8.min
		return try sendSync(message)
	}

	/// Sends a message over the session to the destination service, blocking the caller until receiving an encodable reply message.
	///
	/// This method supports priority inversion avoidance.
	/// Use this method instead of calling
	/// [`send(message:replyHandler:)`]( https://developer.apple.com/documentation/xpc/xpcsession/4169462-send )
	/// and using a semaphore.
	///
	/// Be judicious about your use of this API.
	/// It can block indefinitely.
	/// Calling this method while the session’s target queue is blocked may lead to deadlocks in certain scenarios.
	/// For that reason, invoking this method from the session’s target queue results in a crash.
	///
	/// - Tip: If you provide an API that uses this method, consider allowing callers to specify a queue and callback handler to let you provide results asynchronously.
	///
	/// Sessions send messages serially in a first-in, first-out (FIFO) order.
	/// This method is safe to call from multiple dispatch queues.
	/// The session can’t indicate whether the message *delivery* is successful or not.
	/// While the session may successfully enqueue the message at the remote end of the connection, there’s no guarantee about when the destination dequeues the message and invokes the receiving session’s handler.
	///
	/// - Important: If you create an inactive session, you must activate it before sending messages.
	/// Calling this method with an inactive session crashes.
	///
	/// - Returns: If successful, the response to the message; otherwise this method throws an error.
	func sendSync() throws -> XPCReceivedMessage {
		let message: UInt8 = UInt8.min
		return try sendSync(message)
	}

	/// Sends a message over the session to the destination service, blocking the caller until receiving a reply.
	///
	/// This method supports priority inversion avoidance.
	/// Use this method instead of calling
	/// [`send(message:replyHandler:)`]( https://developer.apple.com/documentation/xpc/xpcsession/4169462-send )
	/// and using a semaphore.
	///
	/// Be judicious about your use of this API.
	/// It can block indefinitely.
	/// Calling this method while the session’s target queue is blocked may lead to deadlocks in certain scenarios.
	/// For that reason, invoking this method from the session’s target queue results in a crash.
	///
	/// - Tip: If you provide an API that uses this method, consider allowing callers to specify a queue and callback handler to let you provide results asynchronously.
	///
	/// Sessions send messages serially in a first-in, first-out (FIFO) order.
	/// This method is safe to call from multiple dispatch queues.
	/// The session can’t indicate whether the message *delivery* is successful or not.
	/// While the session may successfully enqueue the message at the remote end of the connection, there’s no guarantee about when the destination dequeues the message and invokes the receiving session’s handler.
	///
	/// - Important: If you create an inactive session, you must activate it before sending messages.
	/// Calling this method with an inactive session crashes.
	///
	/// - Returns: If successful, the response to the message; otherwise this method throws an error.
	func sendSync() throws -> XPCDictionary {
		let message = XPCDictionary()
		return try sendSync(message: message)
	}
}

// MARK: - send

@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, watchOS 10, *)
public extension XPCSession {
	/// Sends an encodable `message` asynchronously over the session to the destination service.
	///
	/// Sessions send messages serially in a first-in, first-out (FIFO) order.
	/// This method is safe to call from multiple dispatch queues.
	/// The session can’t indicate whether the message *delivery* is successful or not.
	/// While the session may successfully enqueue the message at the remote end of the connection, there’s no guarantee about when the destination dequeues the message and invokes the receiving session’s handler.
	///
	/// If the session fails to send the message, this method throws an error that contains details about the failure.
	///
	/// If the system tears down the session’s connection before receiving a reply, it throws with an
	/// [`XPCRichError`]( https://developer.apple.com/documentation/xpc/xpcricherror )
	/// describing the failure.
	/// For example, the remote service exits prematurely before sending a reply.
	///
	/// - Important: If you create an inactive session, you must activate it before sending messages.
	/// Calling this method with an inactive session crashes.
	///
	/// - Parameters:
	///   - isolation: The actor isolation used to send the message.
	///   The current
	///   [`#isolation`]( https://developer.apple.com/documentation/swift/isolation() )
	///   is used by default.
	///   - message: An encodable object that contains the message to send.
	/// - Returns: If successful, the response to the `message`; otherwise this method throws an error.
	func send<Message, Reply>(
		isolation: isolated (any Actor)? = #isolation,
		_ message: Message
	) async throws -> Reply where
		Message: Encodable,
		Reply: Decodable & Sendable // TODO: `Sendable` should not be a requirement here.
	{
		try await withCheckedThrowingContinuation(
			isolation: isolation
		) { continuation in
			do {
				try self.send(message) { (result: Result<Reply, any Error>) in
					continuation.resume(with: result)
				}
			} catch {
				continuation.resume(throwing: error)
			}
		}
	}

	/// Sends a message asynchronously over the session to the destination service.
	///
	/// Sessions send messages serially in a first-in, first-out (FIFO) order.
	/// This method is safe to call from multiple dispatch queues.
	/// The session can’t indicate whether the message *delivery* is successful or not.
	/// While the session may successfully enqueue the message at the remote end of the connection, there’s no guarantee about when the destination dequeues the message and invokes the receiving session’s handler.
	///
	/// If the session fails to send the message, this method throws an error that contains details about the failure.
	///
	/// If the system tears down the session’s connection before receiving a reply, it throws with an
	/// [`XPCRichError`]( https://developer.apple.com/documentation/xpc/xpcricherror )
	/// describing the failure.
	/// For example, the remote service exits prematurely before sending a reply.
	///
	/// - Important: If you create an inactive session, you must activate it before sending messages.
	/// Calling this method with an inactive session crashes.
	///
	/// - Parameter isolation: The actor isolation used to send the message.
	///   The current
	///   [`#isolation`]( https://developer.apple.com/documentation/swift/isolation() )
	///   is used by default.
	/// - Returns: If successful, the response to the message; otherwise this method throws an error.
	func send<Reply>(
		isolation: isolated (any Actor)? = #isolation
	) async throws -> Reply where
		Reply: Decodable & Sendable // TODO: `Sendable` should not be a requirement here.
	{
		let message: UInt8 = UInt8.min
		return try await send(isolation: isolation, message)
	}

//	/// Sends an encodable `message` asynchronously over the session to the destination service.
//	///
//	/// - Parameters:
//	///   - isolation: The actor isolation used to send the message.
//	///   The current
//	///   [`#isolation`]( https://developer.apple.com/documentation/swift/isolation() )
//	///   is used by default.
//	///   - message: An encodable object that contains the message to send.
//	/// - Returns: If successful, the response to the `message`; otherwise this method throws an error.
//	func send<Message>(
//		isolation: isolated (any Actor)? = #isolation,
//		_ message: Message
//	) async throws -> XPCReceivedMessage where
//		Message: Encodable
//	{
//		try await withCheckedThrowingContinuation(
//			isolation: isolation
//		) { continuation in
//			do {
//				try self.send(message) { (result: Result<XPCReceivedMessage, XPCRichError>) in
//					continuation.resume(with: result)
//				}
//			} catch {
//				continuation.resume(throwing: error)
//			}
//		}
//	}

//	/// Sends a message asynchronously over the session to the destination service.
//	///
//	/// - Parameter isolation: The actor isolation used to send the message.
//	///   The current
//	///   [`#isolation`]( https://developer.apple.com/documentation/swift/isolation() )
//	///   is used by default.
//	/// - Returns: If successful, the response to the message; otherwise this method throws an error.
//	func send(
//		isolation: isolated (any Actor)? = #isolation
//	) async throws -> XPCReceivedMessage {
//		let message: UInt8 = UInt8.min
//		return try await send(isolation: isolation, message)
//	}

//	/// Sends a `message` asynchronously over the session to the destination service.
//	///
//	/// - Parameters:
//	///   - isolation: The actor isolation used to send the message.
//	///   The current
//	///   [`#isolation`]( https://developer.apple.com/documentation/swift/isolation() )
//	///   is used by default.
//	///   - message: A dictionary object that contains the message to send.
//	/// - Returns: If successful, the response to the `message`; otherwise this method throws an error.
//	func send(
//		isolation: isolated (any Actor)? = #isolation,
//		message: XPCDictionary
//	) async throws -> XPCDictionary {
//		try await withCheckedThrowingContinuation(
//			isolation: isolation
//		) { continuation in
//			self.send(message: message) { (result: Result<XPCDictionary, XPCRichError>) in
//				continuation.resume(with: result)
//			}
//		}
//	}

//	/// Sends a message asynchronously over the session to the destination service.
//	///
//	/// - Parameter isolation: The actor isolation used to send the message.
//	///   The current
//	///   [`#isolation`]( https://developer.apple.com/documentation/swift/isolation() )
//	///   is used by default.
//	/// - Returns: If successful, the response to the message; otherwise this method throws an error.
//	func send(
//		isolation: isolated (any Actor)? = #isolation
//	) async throws -> XPCDictionary {
//		let message = XPCDictionary()
//		return try await send(isolation: isolation, message: message)
//	}
}
