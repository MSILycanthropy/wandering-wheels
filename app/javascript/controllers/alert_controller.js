import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.classList.add("transition")
      this.element.classList.add("ease-out")
      this.element.classList.add("opacity-0")

      // Wait a bit before removing the element from the DOM
      setTimeout(() => {
        this.element.remove()
      }, 200)
    }, 1500)
  }
}
