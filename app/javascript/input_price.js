if (document.URL.match( /invoices\/new/ )){
  document.addEventListener("DOMContentLoaded", () => {
    const addItem = document.getElementById("add-item");
    addItem.addEventListener("click", () =>{

      setTimeout(
        function () {
          const items = document.querySelectorAll(".invoice-item-name");
          const prices = document.querySelectorAll(".invoice-item-price");

          items.forEach(function(item, index) {
            item.addEventListener("change", ()=> {
              if(item.value == ""){
                return true;
              }
              const XHR = new XMLHttpRequest();
              XHR.open("GET", `../items/output_price/?name=${item.value}`, true);
              XHR.responseType = "json";
              XHR.send();
              XHR.onload = () => {
                if (XHR.status != 200) {
                  return null;
                }
                console.log(XHR.response.price);
                prices[index].value = XHR.response.price;
              };
            });
          });

        },"1"
      );

    });
  });
}

if (document.URL.match( /invoices\/.+\/edit/ )){
  document.addEventListener("DOMContentLoaded", () => {
    const addItem = document.getElementById("add-item");
    addItem.addEventListener("click", () =>{

      setTimeout(
        function () {
          const items = document.querySelectorAll(".invoice-item-name");
          const prices = document.querySelectorAll(".invoice-item-price");

          items.forEach(function(item, index) {
            item.addEventListener("change", ()=> {
              if(item.value == ""){
                return true;
              }
              const XHR = new XMLHttpRequest();
              XHR.open("GET", `../../items/output_price/?name=${item.value}`, true);
              XHR.responseType = "json";
              XHR.send();
              XHR.onload = () => {
                if (XHR.status != 200) {
                  return null;
                }
                console.log(XHR.response.price);
                prices[index].value = XHR.response.price;
              };
            });
          });

        },"1"
      );

    });
  });
}