AUTHOR ?= stackerbuild.io/bom
ORG ?= org

OS ?= linux
ARCH ?= amd64

BINDIR := bin
BINARY := bom-${OS}-${ARCH}

.PHONY: binary
binary:
	mkdir -p ${BINDIR}
	env CGO_ENABLED=0 GOOS=$(OS) GOARCH=$(ARCH) go build -o ${BINDIR}/${BINARY} -trimpath \
		-ldflags "-X sigs.k8s.io/bom/pkg/spdx.DefaultDocumentAuthor=${AUTHOR} -X sigs.k8s.io/bom/pkg/spdx.DefaultDocumentOrganization=${ORG} -s -w" \
		./cmd/bom/
