import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.open()
    }, 100)

    // Since we can't use stimulus-use, since it uses Stimulus3
    // we need to manually add the event listener
    this.element.addEventListener("mousedown", (event) => {
      if (!event.target.closest(".modal-box")) {
        this.close()
      }
    })

    document.addEventListener("turbo:submit-end", this.close.bind(this))
  }

  disconnect() {
    document.removeEventListener("turbo:submit-end", this.close.bind(this))
  }

  open() {
    this.element.classList.add("modal-open")
  }

  close() {
    this.element.classList.remove("modal-open")
    setTimeout(() => {
      this.element.remove()
    }, 300)
  }
}
