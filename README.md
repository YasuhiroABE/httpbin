# Modified my-httpbin

The goal of this project is to bring the dependencies up to date.

The original information can be found at https://github.com/postmanlabs/httpbin

Run locally:
```sh
podman pull docker.io/yasuhiroabe/my-httpbin:20240808.1645
podman run -p 8080:8080 my-httpbin:20240808.1645
```

## Configuration

### Environment Variables

* FLASGGER_URL_PREFIX (default: "/") - If specified the value, resource files will be available from the specified prefix.

## CahgeLog

### 20240809.1900

* Added the FLASGGER_URL_PREFIX environment variable.

### 20240808.1645

* Initial Release
