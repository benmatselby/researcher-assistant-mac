SCHEME ?= ProlificAssistant

explain:
	### Welcome
	#
	#
	### Testing
	#
	# -> $$ make test

test:
	xcodebuild test -project ProlificAssistant.xcodeproj -scheme "$(SCHEME)" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -enableCodeCoverage YES
