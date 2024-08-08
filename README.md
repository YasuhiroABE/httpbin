# Modified my-httpbin

The goal of this project is to bring the dependencies up to date.

The original information can be found at https://github.com/postmanlabs/httpbin

Run locally:
```sh
podman run -it --rm -p 8080:8080 my-httpbin:20240808.1645
```

Run locally with url-prefix:
```sh
podman run -it --rm -p 8080:8080 --env FLASGGER_URL_PREFIX="/httpbin/" my-httpbin:20240808.2200
```

Access to the **http://localhost:8080/httpbin/**

## Configuration

### Environment Variables

* FLASGGER_URL_PREFIX (default: "/") - If specified the value, resource files will be available from the specified prefix.

## CahgeLog

### 20240809.2200

* Updated the top page information.
* Enabled the docker multi-stage build to reduce the container size.

### 20240809.1900

* Added the FLASGGER_URL_PREFIX environment variable.

### 20240808.1645

* Initial Release
