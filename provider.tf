provider "google" {
  credentials = file("<YOUR-CREDENTIALS-FILE>.json")
  project     = "<YOUR-PROJECT-ID>"
  region      = "us-central1"
}