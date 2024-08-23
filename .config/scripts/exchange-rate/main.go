package main

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
)

const apiURL = "https://openexchangerates.org/api/latest.json?app_id=58b110eb0ea943e29829a1cac7bc42d4"

type ExchangeRates struct {
	Rates map[string]float64 `json:"rates"`
}

func main() {
	// Fetch the exchange rate data
	resp, err := http.Get(apiURL)
	if err != nil {
		log.Fatalf("Failed to fetch data: %v", err)
	}
	defer resp.Body.Close()

	// Read and parse the response
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		log.Fatalf("Failed to read response body: %v", err)
	}

	var rates ExchangeRates
	if err := json.Unmarshal(body, &rates); err != nil {
		log.Fatalf("Failed to parse JSON: %v", err)
	}

	// Get the exchange rate between VND and JPY
	vndToJpy := rates.Rates["JPY"]
	vndToUsd := rates.Rates["VND"]
	if vndToUsd == 0 {
		log.Fatal("Exchange rate for VND not found.")
	}

	// Print the exchange rate
	fmt.Printf("%.2f", vndToUsd/vndToJpy)
}
