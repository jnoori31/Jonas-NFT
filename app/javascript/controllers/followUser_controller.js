import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ['followBtn']

    refresh() {
        if (this.followBtnTarget.innerText == "Follow") {
            this.followBtnTarget.innerText = "Following";
        } else {
            this.followBtnTarget.innerText = "Follow";
        }
    }
}