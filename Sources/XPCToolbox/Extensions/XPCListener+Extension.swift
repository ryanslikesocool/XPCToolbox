@preconcurrency import XPC

// MARK: - init

@available(macCatalyst 17.4, macOS 14, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public extension XPCListener {
	/// Creates the server side of an XPC service using the specified service name.
	///
	/// Listener creation fails if the XPC service isn’t found or is unavailable.
	///
	/// When a client connects to your service, the system invokes the `incomingSessionHandler` with a request that you must either accept or reject.
	/// To accept the incoming request, choose one of the following two approaches:
	/// - For simple protocols, use
	/// [`accept(incomingMessageHandler:cancellationHandler:)`]( https://developer.apple.com/documentation/xpc/xpclistener/incomingsessionrequest/4169353-accept )
	/// or
	/// [`accept(incomingMessageHandler:cancellationHandler:)`]( https://developer.apple.com/documentation/xpc/xpclistener/incomingsessionrequest/4169354-accept )
	/// to provide a closure that receives the incoming message directly.
	/// - For more complex protocols that delegate message handling to a different object, use
	/// [`accept(_:)`]()
	/// to provide a closure that returns a
	/// [`XPCPeerHandler`]( https://developer.apple.com/documentation/xpc/xpcpeerhandler ).
	/// The peer handler object receives incoming messages from the client directly.
	///
	/// When the `incomingSessionHandler` returns, the system automatically activates the peer session unless you explicitly reject it or pass the
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpclistener/initializationoptions/4169366-inactive )
	/// initialzation option.
	///
	/// - Parameters:
	///   - service: The Mach service or XPC service name that clients use to connect to the service.
	///   - targetQueue: The dispatch queue that events arrive on.
	///   This may be a concurrent queue.
	///   If `nil`, the listeners uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Configuration options for the listener, such as creating it in an inactive state.
	///   - incomingSessionHandler: A handler that the system calls when a client connects to the XPC service.
	convenience init(
		service: borrowing some ServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCListener.InitializationOptions = .none,
		incomingSessionHandler: @escaping (XPCListener.IncomingSessionRequest) -> (XPCListener.IncomingSessionRequest.Decision)
	) throws {
		try self.init(
			service: service.rawValue,
			targetQueue: targetQueue,
			options: options,
			incomingSessionHandler: incomingSessionHandler
		)
	}

	/// Creates the server side of an XPC service using the specified service name.
	///
	/// Listener creation fails if the XPC service isn’t found or is unavailable.
	///
	/// When a client connects to your service, the system invokes the `incomingSessionHandler` with a request that you must either accept or reject.
	/// To accept the incoming request, choose one of the following two approaches:
	/// - For simple protocols, use
	/// [`accept(incomingMessageHandler:cancellationHandler:)`]( https://developer.apple.com/documentation/xpc/xpclistener/incomingsessionrequest/4169353-accept )
	/// or
	/// [`accept(incomingMessageHandler:cancellationHandler:)`]( https://developer.apple.com/documentation/xpc/xpclistener/incomingsessionrequest/4169354-accept )
	/// to provide a closure that receives the incoming message directly.
	/// - For more complex protocols that delegate message handling to a different object, use
	/// [`accept(_:)`]()
	/// to provide a closure that returns a
	/// [`XPCPeerHandler`]( https://developer.apple.com/documentation/xpc/xpcpeerhandler ).
	/// The peer handler object receives incoming messages from the client directly.
	///
	/// When the `incomingSessionHandler` returns, the system automatically activates the peer session unless you explicitly reject it or pass the
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpclistener/initializationoptions/4169366-inactive )
	/// initialzation option.
	///
	/// - Parameters:
	///   - xpcService: The XPC service name that clients use to connect to the service.
	///   - targetQueue: The dispatch queue that events arrive on.
	///   This may be a concurrent queue.
	///   If `nil`, the listeners uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Configuration options for the listener, such as creating it in an inactive state.
	///   - incomingSessionHandler: A handler that the system calls when a client connects to the XPC service.
	convenience init(
		xpcService: borrowing XPCServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCListener.InitializationOptions = .none,
		incomingSessionHandler: @escaping (XPCListener.IncomingSessionRequest) -> (XPCListener.IncomingSessionRequest.Decision)
	) throws {
		try self.init(
			service: xpcService,
			targetQueue: targetQueue,
			options: options,
			incomingSessionHandler: incomingSessionHandler
		)
	}

	/// Creates the server side of an XPC service using the specified service name.
	///
	/// Listener creation fails if the XPC service isn’t found or is unavailable.
	///
	/// When a client connects to your service, the system invokes the `incomingSessionHandler` with a request that you must either accept or reject.
	/// To accept the incoming request, choose one of the following two approaches:
	/// - For simple protocols, use
	/// [`accept(incomingMessageHandler:cancellationHandler:)`]( https://developer.apple.com/documentation/xpc/xpclistener/incomingsessionrequest/4169353-accept )
	/// or
	/// [`accept(incomingMessageHandler:cancellationHandler:)`]( https://developer.apple.com/documentation/xpc/xpclistener/incomingsessionrequest/4169354-accept )
	/// to provide a closure that receives the incoming message directly.
	/// - For more complex protocols that delegate message handling to a different object, use
	/// [`accept(_:)`]()
	/// to provide a closure that returns a
	/// [`XPCPeerHandler`]( https://developer.apple.com/documentation/xpc/xpcpeerhandler ).
	/// The peer handler object receives incoming messages from the client directly.
	///
	/// When the `incomingSessionHandler` returns, the system automatically activates the peer session unless you explicitly reject it or pass the
	/// [`inactive`]( https://developer.apple.com/documentation/xpc/xpclistener/initializationoptions/4169366-inactive )
	/// initialzation option.
	///
	/// - Parameters:
	///   - machService: The Mach service name that clients use to connect to the service.
	///   - targetQueue: The dispatch queue that events arrive on.
	///   This may be a concurrent queue.
	///   If `nil`, the listeners uses `DISPATCH_TARGET_QUEUE_DEFAULT`.
	///   - options: Configuration options for the listener, such as creating it in an inactive state.
	///   - incomingSessionHandler: A handler that the system calls when a client connects to the XPC service.
	convenience init(
		machService: borrowing MachServiceName,
		targetQueue: DispatchQueue? = nil,
		options: XPCListener.InitializationOptions = .none,
		incomingSessionHandler: @escaping (XPCListener.IncomingSessionRequest) -> (XPCListener.IncomingSessionRequest.Decision)
	) throws {
		try self.init(
			service: machService,
			targetQueue: targetQueue,
			options: options,
			incomingSessionHandler: incomingSessionHandler
		)
	}
}
