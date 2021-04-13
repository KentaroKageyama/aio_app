import Sortable from 'sortablejs';

if(document.URL.match( /new/)) {
  const sort = () => {

    $(function() {
      var el, sortable;
      el = document.getElementById("item_ul");
      if (el !== null) {
        return sortable = Sortable.create(el, {
          handle: '.handle', 
          ghostClass: 'blue-background',
          animation: 200,
          delay: 100,
          onUpdate: function(evt) {
            return $.ajax({
              url: '/items/sort',
              type: 'patch',
              data: {
                from: evt.oldIndex,
                to: evt.newIndex
              }
            });
          }
        });
      }
    });

    $(function() {
      var el, sortable;
      el = document.getElementById("part_ul");
      if (el !== null) {
        return sortable = Sortable.create(el, {
          handle: '.handle', 
          ghostClass: 'blue-background',
          animation: 200,
          delay: 100,
          onUpdate: function(evt) {
            return $.ajax({
              url: '/parts/sort',
              type: 'patch',
              data: {
                from: evt.oldIndex,
                to: evt.newIndex
              }
            });
          }
        });
      }
    });

    $(function() {
      var el, sortable;
      el = document.getElementById("glass_ul");
      if (el !== null) {
        return sortable = Sortable.create(el, {
          handle: '.handle', 
          ghostClass: 'blue-background',
          animation: 200,
          delay: 100,
          onUpdate: function(evt) {
            return $.ajax({
              url: '/glasses/sort',
              type: 'patch',
              data: {
                from: evt.oldIndex,
                to: evt.newIndex
              }
            });
          }
        });
      }
    });

    $(function() {
      var el, sortable;
      el = document.getElementById("collection_ul");
      if (el !== null) {
        return sortable = Sortable.create(el, {
          handle: '.handle', 
          ghostClass: 'blue-background',
          animation: 200,
          delay: 100,
          onUpdate: function(evt) {
            return $.ajax({
              url: '/collections/sort',
              type: 'patch',
              data: {
                from: evt.oldIndex,
                to: evt.newIndex
              }
            });
          }
        });
      }
    });

    $(function() {
      var el, sortable;
      el = document.getElementById("category_ul");
      if (el !== null) {
        return sortable = Sortable.create(el, {
          handle: '.handle', 
          ghostClass: 'blue-background',
          animation: 200,
          delay: 100,
          onUpdate: function(evt) {
            return $.ajax({
              url: '/categories/sort',
              type: 'patch',
              data: {
                from: evt.oldIndex,
                to: evt.newIndex
              }
            });
          }
        });
      }
    });

    $(function() {
      var el, sortable;
      el = document.getElementById("material_ul");
      if (el !== null) {
        return sortable = Sortable.create(el, {
          handle: '.handle', 
          ghostClass: 'blue-background',
          animation: 200,
          delay: 100,
          onUpdate: function(evt) {
            return $.ajax({
              url: '/materials/sort',
              type: 'patch',
              data: {
                from: evt.oldIndex,
                to: evt.newIndex
              }
            });
          }
        });
      }
    });

    $(function() {
      var el, sortable;
      el = document.getElementById("opal_ul");
      if (el !== null) {
        return sortable = Sortable.create(el, {
          handle: '.handle', 
          ghostClass: 'blue-background',
          animation: 200,
          delay: 100,
          onUpdate: function(evt) {
            return $.ajax({
              url: '/opal_colors/sort',
              type: 'patch',
              data: {
                from: evt.oldIndex,
                to: evt.newIndex
              }
            });
          }
        });
      }
    });

  };
  
  window.addEventListener("load", sort);
}


