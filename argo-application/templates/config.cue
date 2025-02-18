package templates

import (
	timoniv1 "timoni.sh/core/v1alpha1"
)

// Config defines the schema and defaults for the Instance values.
#Config: {
	moduleVersion!: string

	metadata: timoniv1.#Metadata & {#Version: moduleVersion}

	metadata: labels: timoniv1.#Labels

	// The annotations allows adding `metadata.annotations` to all resources.
	metadata: annotations?: timoniv1.#Annotations

	project: string | *"default"

	source: {
		chart!:         string
		repoUrl:        string & =~"^(http|https|oci)://.*$"
		targetRevision: string
	}

	helmInput: {
		releaseName:             string | *source.chart
		ignoreMissingValueFiles: bool | *false
		passCredentials:         bool | *true
		skipCrds:                bool | *true
		skipSchemaValidation:    bool | *true
		skipTests:               bool | *true
		// optional
		values?: string
		valueFiles?: [...]
	}

	destination: {
		name:      string | *"https://kubernetes.default.svc"
		namespace: string | *"default"
	}
}

#Instance: {
	config: #Config
	objects: application: #Application & {#config: config}
}
