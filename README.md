# Test React Application

This `create-react-app` based empty app is to try to work out how to write Nix
expressions for such projects that generate static assets as their build output.

## Without nix

```shell
$ yarn && yarn build
```

The output is the `build** directory that needs to be served by a web-server.

## With nix

**NOTE: Does not work just yet**

```shell
$ nix-build -A webui
```
