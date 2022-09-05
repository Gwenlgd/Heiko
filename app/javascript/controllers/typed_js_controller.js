import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Trying to understand what your body is telling you? ^1000 <p></p> <p>HEIKO will help you to find the food what cost you the problems.</p>"],
      typeSpeed: 60,
      loop: false,
      loopCount: 0,
      startDelay: 1000,
      contentType: "html",
      showCursor: ""
    })
  }
}
