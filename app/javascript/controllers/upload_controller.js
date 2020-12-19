import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["label"];

  connect() {
    console.log('hello');
  }

  updateFilename(event) {
    this.labelTarget.innerText = event.target.files[0].name;
  }
}
