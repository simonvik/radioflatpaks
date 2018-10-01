REPO=./repo

all: GQRX.flatpak

app: dk.gqrx.App.json
	rm -rf build1
	rm -rf build2
	flatpak-builder --force-clean --ccache --require-changes --repo=$(REPO)1 ./build1 dk.gqrx.App.json
	flatpak-builder --force-clean --ccache --require-changes --repo=$(REPO)2 ./build2 com.sdrangel.App.json

GQRX.flatpak: app
	flatpak build-bundle $(REPO)1 GQRX.flatpak dk.gqrx.App
	flatpak build-bundle $(REPO)2 GQRX.flatpak com.sdrangel.App

check:
	json-glib-validate *.json
