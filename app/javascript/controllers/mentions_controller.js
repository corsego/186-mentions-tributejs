import { Controller } from "@hotwired/stimulus"
import Tribute from 'tributejs'

// Connects to data-controller="mentions"
export default class extends Controller {
  connect() {
    this.tribute = new Tribute({
      values: [
        { key: "Phil Heartman", value: "pheartman" },
        { key: "Gordon Ramsey", value: "gramsey" }
      ]
    });
    this.tribute.attach(this.element)
  }
}
