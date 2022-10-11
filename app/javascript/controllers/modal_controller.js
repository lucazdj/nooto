import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  close(event) {
    console.log("okei")
    event.target.parentElement.removeAttribute("src") // it might be nice to also remove the modal SRC
    event.target.remove()
  }
}
