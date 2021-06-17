import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ['like_count']

    refresh() {
        const idNft = this.like_countTarget.dataset.nftid;
        fetch(`/nfts/${idNft}`, { headers: { accept: "application/json" }})
            .then(response => response.json())
            .then((data) => {
                this.like_countTarget.innerText = data.nft;
                // this.like_countTarget.classList.toggle('red');
            })
    }
}