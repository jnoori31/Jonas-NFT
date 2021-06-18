import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ['like_count']

    refresh() {
        let t = this.like_countTarget;
        if (t.classList.contains('red')) {
            t.innerText = +t.innerText - 1
        } else {
            t.innerText = +t.innerText + 1
        }
        t.classList.toggle('red');
    }
}