import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cars"
export default class extends Controller {
  edit(event) {
    document.querySelector("#modal").src = event.currentTarget.dataset.path
  }
}
