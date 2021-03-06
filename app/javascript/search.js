if(document.URL.match(/items$/)){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("input-item");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("input-item").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `items/incremental_search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const itemName = XHR.response.keyword;
          itemName.forEach((item) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", item.id);
            childElement.innerHTML = item.chain_name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(item.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("input-item").value = clickElement.textContent;
              const childClass = document.querySelectorAll(".child");
              childClass.forEach(function(child) {
                child.remove();
              });
            });
          });
        };
      };
    });
  });
}

