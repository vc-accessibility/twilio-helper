# twilio-helper

Runs the twilio-cli in a container. Not super performant but for one off use, it works pretty well.

First up, copy secrets.env.sample to secrets.env and fill in the correct information. Make sure you have `make` and `podman` installed.

```bash
$ cp secrets.env.sample secrets.env
$ vi secrets.env #consult twilio console for info
$sudo dnf install make podman #assumes recent fedora
```

Consult the make file (run `make` on the command line) for up to date usage instructions but, at the moment:

* `make build` - Build and locally tag a new image
* `make build-force` - Use a no-cache build
* `make run-int` - Run the new image interactively and you can use the twilio-cli multiple times without overhead
* normal usage: `podman run -it --env-file secrets.env --rm $USER/twilio-helper <params>` or setup
an alias `alias twilio-cli='podman run -it --env-file secrets.env --rm $USER/twilio-helper'`
