
var ranklistBinding = new Shiny.InputBinding();

$.extend(ranklistBinding, {

  find: function(scope) {
    // find all instances of class rank-list-container
    return $(scope).find(".rank-list-container");
  },

  // this method will be called on initialization
  initialize: function(el){ },

  // this method will also be called on initialisation (to pass the intial state to input$...)
  // and each time when the callback is triggered via the event bound in subscribe
  getValue: function(el) { },

  setValue: function (el, data) {
    if (data.text) {
      $(el).find(".rank-list-title").text(data.text);
    }

    if (data.labels) {
      // Get the input ID from the .rank-list child element (not the container)
      const rankListEl = $(el).find(".rank-list");
      const inputId = rankListEl.attr("id");
      rankListEl.html(data.labels);
      const label_ids = rankListEl.children().map((idx, child) => {
        return $(child).attr("data-rank-id") || $.trim(child.innerHTML);
      }).toArray();
      Shiny.setInputValue(inputId, label_ids, {priority: 'event'});
    }

  },

  subscribe: function(el, callback) { },

  receiveMessage: function(el, data) {
    this.setValue(el, data);
  }

});


// register the binding so Shiny knows it exists
Shiny.inputBindings.register(ranklistBinding);




// ---- bucket list binding ----------------------------------------------------


var bucketlistBinding = new Shiny.InputBinding();

$.extend(bucketlistBinding, {

  find: function(scope) {
    // find all instances of class bucket-list-container
    return $(scope).find(".bucket-list-container");
  },

  // this method will be called on initialization
  initialize: function(el){ },

  // this method will also be called on initialisation (to pass the intial state to input$...)
  // and each time when the callback is triggered via the event bound in subscribe
  getValue: function(el) { },

  setValue: function (el, data) {
    // console.log(data);
    if (data.header) {
      $(el).find(".bucket-list-header").text(data.header);
    }
  },


  subscribe: function(el, callback) { },

  receiveMessage: function(el, data) {
    this.setValue(el, data);
  }

});


// register the binding so Shiny knows it exists
Shiny.inputBindings.register(bucketlistBinding);
