BINARY_NAME=mpv-url-handler

all: build

build:
	go build -o ${BINARY_NAME} main.go
 
clean:
	go clean
	rm ${BINARY_NAME}

install:
	cp ${BINARY_NAME} /usr/local/bin/
