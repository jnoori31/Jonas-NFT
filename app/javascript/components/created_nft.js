const createdNft = () => {
    const btnYes = document.getElementById('created-nft-yes-btn');
    const btnNo = document.getElementById('created-nft-no-btn');
    const submitBtn = document.getElementById('submit-new-nft-btn');
    const hiddenInput = document.getElementById('hidden-created');
    if (submitBtn) {
        btnYes.addEventListener('click', (event) => {
            event.currentTarget.classList.add('background-grey');
            btnNo.classList.remove('background-grey');
        })
        btnNo.addEventListener('click', (event) => {
            event.currentTarget.classList.add('background-grey');
            btnYes.classList.remove('background-grey');
        })
    
        submitBtn.addEventListener('click', (event) => {
            if (btnYes.classList.contains('background-grey')) {
                hiddenInput.value = "true";
            }
        })
    }
}

export { createdNft };