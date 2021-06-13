package main

import (
    "encoding/base64"
    "fmt"
    "os"
    "os/exec"
    "strings"
)

func main() {
    arglen := len(os.Args[1:])
    if arglen < 1 {
        fmt.Println("URL was not specified")
        return
    }

    url := os.Args[1]
    // Strip protocol from URL
    urlParts := strings.Split(url, "mpv://")
    if len(urlParts) > 1 {
        url = urlParts[1]
    }
    url = strings.TrimSuffix(url, "/")
    urlDecoded, err := base64.StdEncoding.DecodeString(url)
    if err != nil {
        fmt.Println("URL decode failed: ", err)
        return
    }
    // Start mpv and pass raw url to it
    mpvCmd := exec.Command("mpv", string(urlDecoded))
    err = mpvCmd.Run()
    if err != nil {
        fmt.Println("Could not start mpv: ", err)
    }
}
