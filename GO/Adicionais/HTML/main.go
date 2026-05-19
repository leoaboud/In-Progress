package main

import (
	"fmt"
	"html/template"
	"log"
	"net/http"
)

var templates *template.Template

func main() {

	templates = template.Must(template.ParseGlob("*.html"))


	http.HandleFunc("/home", func(w http.ResponseWriter, r *http.Request) {
		templates.ExecuteTemplate(w, "home.html", nil)
	})

	fmt.Println("Escutando a porta 5000")
	log.Fatal(http.ListenAndServe(":5000", nil))
}