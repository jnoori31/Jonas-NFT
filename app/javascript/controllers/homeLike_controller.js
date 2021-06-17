import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ['likeCount'] 

    likeUpdate() {
        let t = this.likeCountTarget;
        if (t.classList.contains('red')) {
            t.innerText = +t.innerText - 1;
        } else {
            t.innerText = +t.innerText + 1;
        }
        t.classList.toggle('red');
    }
}