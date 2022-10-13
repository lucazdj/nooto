import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['notice'];

  connect() {
    console.log("connect");
    setTimeout(() => {
      this['noticeTarget'].parentElement.removeAttribute("src");
      this['noticeTarget'].remove();
    }, 3000);
  }

  disconnect() {
    console.log("disconnect");
  }
}
