workspace "Referral application" {
	model {
		user = person "End user"

		desktopApplication = softwaresystem "Desktop application" {
			client = container "GUI Client"
			core = container "Platform+"
		}

		webApplication = softwaresystem "Web Application" {
			webFrontend = container "Web Frontend"
		}

		mobileApplication = softwaresystem "Mobile application" {
			mobileClient = container "Mobile client"
		}

		apiGateway = softwaresystem "API Gateway" "KrakenD"

		orgServer = softwaresystem "Organisation Server"

		worldServer = softwaresystem "World server"

		# people relationships
		user -> desktopApplication "Interact with file system"
		user -> webApplication "Show files and share links"
		user -> mobileApplication "Show files and share links"

		# software system relationships
		desktopApplication -> apiGateway "Send transaction data" "REST"
		webApplication -> apiGateway "Send transaction data" "REST"
		mobileApplication -> apiGateway "Send transaction data" "REST"
		orgServer -> apiGateway "Authenticate requests" "REST"
		apiGateway -> worldServer "Authenticate requests" "REST"
		apiGateway -> orgServer "Get organisation data" "REST"

		# container relationships
		core -> apiGateway "Do important stuff" "REST"
		client -> core "Get file system data" "REST"
	}

	views {
		systemlandscape "SystemLandscape" {
				include *
				autoLayout
		}

		systemcontext desktopApplication "SystemContext" {
			include *
			autoLayout
		}

		container desktopApplication "Containers" {
			include *
			autoLayout
		}

		theme default

		styles {
			element "External System" {
					background #999999
					color #ffffff
			}
		}
	}
}