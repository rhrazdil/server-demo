package main

import (
	"fmt"
	"net/http"
	"os"
)

func version(w http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(w, "v1\n")
}

func serve() error {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	fmt.Printf("Serving on localhost and port %s ", port)
	return http.ListenAndServe(":"+port, nil)
}

func main() {
	http.HandleFunc("/version", version)
	err := serve()
	if err != nil {
		fmt.Println(err.Error())
	}
}
