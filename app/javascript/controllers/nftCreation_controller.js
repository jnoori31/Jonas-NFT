import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ['nftToken']

    searchNft() {
        const idToken = this.nftTokenTarget.value;
        console.log(idToken);
        const nftUrl = `https://metadata.mintable.app/mintable_gasless/${idToken}`;
        fetch(nftUrl)
            .then(response => response.json())
            .then((data) => {
                console.log(data);
                // exact same thing as in nfts controller using RestClient gem
        })
    }
}