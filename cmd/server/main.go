package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	port := "8080"

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello: %q\n", r.URL.Path)
	})

	log.Println("Listeining on port " + port)

	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		log.Fatal(err)
	}
}
