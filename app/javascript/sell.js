function sellChange(){
  const sellStatus = document.getElementById("collection-status")
  const sellInfoDisplay = document.getElementById("sell-info-form")
  const sellPriceDisplay = document.getElementById("sell-price-form")
  const sellButton = document.getElementById("sell-btn")
  const postButton = document.getElementById("post-btn")

  console.log(sellStatus.value)
  if(sellStatus.value != 3){
    sellInfoDisplay.setAttribute("style", "display: none;")
    sellPriceDisplay.setAttribute("style", "display: none;")
    sellButton.setAttribute("style", "display: none;")
  } else {
    postButton.setAttribute("style", "display: none;")
  }

  sellStatus.addEventListener('change', () => {
    console.log(sellStatus.value)
    if(sellStatus.value == 3) {
      sellInfoDisplay.removeAttribute("style", "display: none;")
      sellPriceDisplay.removeAttribute("style", "display: none;")
      sellButton.removeAttribute("style", "display: none;")
      postButton.setAttribute("style", "display: none;")
    } else {
      sellInfoDisplay.setAttribute("style", "display: none;")
      sellPriceDisplay.setAttribute("style", "display: none;")
      sellButton.setAttribute("style", "display: none;")
      postButton.removeAttribute("style", "display: none;")
    }
  })
}
    
window.addEventListener('load', sellChange)