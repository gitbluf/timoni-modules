# argo-application

A [timoni.sh](http://timoni.sh) module for deploying argo-application to Kubernetes clusters.

## Install

To create an instance using the default values:

```shell
timoni -n default apply argo-application oci://<container-registry-url>
```

To change the [default configuration](#configuration),
create one or more `values.cue` files and apply them to the instance.

For example, create a file `my-values.cue` with the following content:

```cue
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
```

And apply the values with:

```shell
timoni -n default apply argo-application oci://<container-registry-url> \
--values ./my-values.cue
```

## Uninstall

To uninstall an instance and delete all its Kubernetes resources:

```shell
timoni -n default delete argo-application
```

## Configuration TODO
