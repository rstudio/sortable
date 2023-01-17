HTMLWidgets.widget({

  name: 'sortable',

  type: 'output',

  initialize: function(el, width, height) {

    // for now set display to none if height and width = 0
    //  however eventually might add option to wrap
    //  a list or vector within sortable
    if(width === 0 && height === 0){
      el.style.display = "none"
    }

    return { };

  },

  renderValue: function(el, x, instance) {


    instance.sortable = Sortable.create(
      document.getElementById( x.css_id ),
      x.options
    )

    if (instance.sortable.options.onLoad instanceof Function) {
      // init the sortable
      setTimeout(
        function() {
          var evt = document.createEvent('Event');
          evt.initEvent("onLoad", true, true);
          instance.sortable.options.onLoad.apply(instance.sortable, [evt]);
        },
        0
      )
    }
  },

  resize: function(el, width, height, instance) {

  }

});
