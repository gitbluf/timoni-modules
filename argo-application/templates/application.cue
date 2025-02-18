package templates

import (
	app "argoproj.io/application/v1alpha1"
)

#Application: app.#Application & {
	#config:  #Config
	metadata: #config.metadata
	spec: app.#ApplicationSpec & {
		project: #config.project
		source: {
			chart:   #config.source.chart
			repoURL: #config.source.repoUrl
			helm:    #config.helmInput
		}
		destination: #config.destination
	}
}
