HTMLWidgets.widget({

  name: 'sortableR',

  type: 'output',

  initialize: function(el, width, height) {

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
