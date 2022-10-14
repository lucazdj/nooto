import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['dialog', 'content'];

  contentTargetConnected(target) {
    this['dialogTarget'].show();
  }

  close(event) {
    if ((event.type === 'click' && event.target === event.currentTarget) || (event.type === 'keyup' && event.code === "Escape")) {
      this['dialogTarget'].close();
      this['contentTarget'].remove();
    }
  }
}
