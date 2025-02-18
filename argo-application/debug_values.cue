@if(debug)

package main

// Values used by debug_tool.cue.
// Debug example 'cue cmd -t debug -t name=test -t namespace=test -t mv=1.0.0 -t kv=1.28.0 build'.
values: {
	source: {
		chart:          "reloader"
		repoUrl:        "https://charts.jetstack.io"
		targetRevision: "v1.17.0"
	}
	helmInput: {
		releaseName: "reloader-custom"
		valueFiles: [
			"example-values.yaml",
		]
		values: ##"""
			test: test
			test2: test2
			test3: test3
			"""##
	}
}
