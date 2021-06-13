BINARY_NAME=mpv-handler

all: build

build:
	go build -o ${BINARY_NAME} main.go

build-win64:
	env GOOS=windows GOARCH=amd64 go build -ldflags -H=windowsgui -o ${BINARY_NAME}.exe

build-win32:
	env GOOS=windows GOARCH=386 go build -ldflags -H=windowsgui -o ${BINARY_NAME}.exe

build-linux32:
	env GOOS=linux GOARCH=386 go build -o ${BINARY_NAME}

build-linux64:
	env GOOS=linux GOARCH=amd64 go build -o ${BINARY_NAME}

clean:
	go clean
	rm ${BINARY_NAME} ${BINARY_NAME}.exe

install:
	cp ${BINARY_NAME} /usr/local/bin/
