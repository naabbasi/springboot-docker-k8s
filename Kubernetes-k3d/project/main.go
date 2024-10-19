package main

// Import Packages
import (
    "html/template"
    "log"
    "net/http"
    "os"
)

type PageData struct {
    Hostname string
}

func main() {
    hostname, err := os.Hostname()
    if err != nil {
        log.Println("Error:", err)
        return
    }

    log.Println("Hostname:", hostname)

    tmpl := template.Must(template.ParseFiles("./content/about.html"))
    http.HandleFunc("/about", func(w http.ResponseWriter, r *http.Request) {
        data := PageData{
            Hostname: hostname,
        }

        tmpl.Execute(w, data)
    })

    // Server the Desired HTML File
    http.Handle("/", http.FileServer(http.Dir("./content")))

    log.Fatal(http.ListenAndServe(":9091", nil))
}