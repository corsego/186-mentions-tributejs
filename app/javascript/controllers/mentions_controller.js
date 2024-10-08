import { Controller } from "@hotwired/stimulus"
import Tribute from 'tributejs'
import { get } from '@rails/request.js'

// Connects to data-controller="mentions"
export default class extends Controller {
  connect() {
    this.tribute = new Tribute({
      // values: [
      //   { key: "Phil Heartman", value: "pheartman" },
      //   { key: "Gordon Ramsey", value: "gramsey" }
      // ]
      values: async (text, cb) => {
        const response = await get(`/users.json?query=${text}`)
        if (response.ok) {
          const users = await response.json
          cb(users.map(user => ({key: user.username, value: user.username})))
        }
      }
    });
    this.tribute.attach(this.element)
  }
}
