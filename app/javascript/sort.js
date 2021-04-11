import Sortable from 'sortablejs';

if(document.URL.match( /localhost/)) {
  const sort = () => {
    var el  =  document.getElementById('opal'); 
    var sortable  =  Sortable.create(el);
  };
  
  window.addEventListener("load", sort);
}