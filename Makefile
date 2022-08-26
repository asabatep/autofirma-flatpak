all: build-fp run

build-af:
	docker run -v $$(pwd)/work:/work -v $$(pwd)/build-autofirma.sh:/build-autofirma.sh --rm debian:11 /build-autofirma.sh

build-fp:
	rm -rf build
	mkdir build
	flatpak-builder --user --install --force-clean build com.ctt.AutoFirma.yaml

run:
	flatpak run com.ctt.AutoFirma
