# Modified my-httpbin

The goal of this project is to bring the dependencies up to date.

The original information can be found at https://github.com/postmanlabs/httpbin

Run locally:
```sh
podman run -p 8080:8080 -it --rm docker.io/yasuhiroabe/my-httpbin
```

Run locally with url-prefix:
```sh
podman run -p 8080:8080 -it --rm --env FLASGGER_URL_PREFIX="/httpbin/" docker.io/yasuhiroabe/my-httpbin
```

Access to the **http://localhost:8080/httpbin/**

## Configuration

### Environment Variables

* FLASGGER_URL_PREFIX (default: "/")
* HTTPBIND_AUTHOR_NAME (default: YasuhiroABE)
* HTTPBIND_AUTHOR_EMAIL (default: yasu@yasundial.org)
* HTTPBIND_AUTHOR_URL (default: https://www.yadiary.net/)
* HTTPBIND_VERSION (default: 0.9.2)
* HTTPBIND_TITLE (default: httpbin.org Compatible API Server)

## Building Container

The default container engine is "podman".
If you would like to use the docker command, please override the DOCKER_CMD environment variable or edit the Makefile directly.

### To test the container

```sh
$ make docker-build
$ make docker-run
```

### To release the production Container

First, change the REGISTRY_LIBRARY variable of Makefile to your environmnet.

```sh
$ make docker-build-prod
$ make docker-tag
$ podman login docker.io
$ make docker-push
$ podman logout docker.io
```

## CahgeLog

### TBD

* Revised the README.md file.

### 20240811.2245

* Added YAML files using for the Kubernetes deployment.
* Added the non-root "httpbin" user to run the application.
* Fixed the digest-auth function based on the psf version of httpbin, https://github.com/psf/httpbin

### 20240809.1330

* Changed the web-font setting and the font-weight from 600 to 400.

### 20240809.1030

* Fixed the typo of README.md
* Fixed the path of favicon.ico
* Added environment variables

### 20240808.2200

* Updated the top page information.
* Enabled the docker multi-stage build to reduce the container size.

### 20240808.1900

* Added the FLASGGER_URL_PREFIX environment variable.

### 20240808.1645

* Initial Release
