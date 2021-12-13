 function pullDown(){
  const pullDownButton = document.getElementById("lists")
  const pullDownParents = document.getElementById("pulldown")
  const pullDownMyPage = document.getElementById("my-page")
  const pullDownPost = document.getElementById("post")
  const pullDownMyWants = document.getElementById("my-wants")
  const pullDownLogout = document.getElementById("logout")
  
  pullDownButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "color:red;")
  })

  pullDownButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "color:red;")
  })

  document.addEventListener('click', (e) => {
    if(!e.target.closest("#lists")) {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })

  pullDownMyPage.addEventListener('mouseover', function(){
    this.setAttribute("style", "color:red;")
  })
  pullDownMyPage.addEventListener('mouseout', function(){
    this.removeAttribute("style", "color:red;")
  })

  pullDownPost.addEventListener('mouseover', function(){
    this.setAttribute("style", "color:red;")
  })
  pullDownPost.addEventListener('mouseout', function(){
    this.removeAttribute("style", "color:red;")
  })

  pullDownMyWants.addEventListener('mouseover', function(){
    this.setAttribute("style", "color:red;")
  })
  pullDownMyWants.addEventListener('mouseout', function(){
    this.removeAttribute("style", "color:red;")
  })

  pullDownLogout.addEventListener('mouseover', function(){
    this.setAttribute("style", "color:red;")
  })
  pullDownLogout.addEventListener('mouseout', function(){
    this.removeAttribute("style", "color:red;")
  })

}

window.addEventListener('load', pullDown)