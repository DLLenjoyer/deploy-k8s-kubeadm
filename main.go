package main

import (
    "fmt"
    "net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Hello kube")
}

func main() {
    http.HandleFunc("/", helloHandler)
    http.ListenAndServe(":8083", nil)
}