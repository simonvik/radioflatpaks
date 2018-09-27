REPO=./repo

all: GQRX.flatpak

app: dk.gqrx.App.json
	rm -rf build
	flatpak-builder --force-clean --ccache --require-changes --repo=$(REPO) ./build dk.gqrx.App.json

GQRX.flatpak: app
	flatpak build-bundle $(REPO) GQRX.flatpak dk.gqrx.App

check:
	json-glib-validate *.json
