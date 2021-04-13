if(document.URL.match( /localhost/)) {
  function multiple (){
    const selectBox = document.getElementById("select-box");
    selectBox.addEventListener("change", () => {
      console.log("test");
    });
  };

  window.addEventListener("load", multiple);
}

