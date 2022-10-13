import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['dialog'];

  close(event) {
    if (event.target === event.currentTarget) {

      this['dialogTarget'].parentElement.removeAttribute("src");
      this['dialogTarget'].remove();
    }
  }
}
