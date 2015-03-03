HTMLWidgets.widget({

  name: 'sortableR',

  type: 'output',

  initialize: function(el, width, height) {

    // for now set display to none if height and width = 0
    //  however eventually might add option to wrap
    //  a list or vector within sortableR
    if(width === 0 && height === 0){
      el.style.display = "none"
    }

    return { };

  },

  renderValue: function(el, x, instance) {


    instance.sortable = Sortable.create(
      document.getElementById( x.selector ),
      x.options
    )

  },

  resize: function(el, width, height, instance) {

  }

});
