
var ranklistBinding = new Shiny.InputBinding();

$.extend(ranklistBinding, {

  find: function(scope) {

    // find all instances of class rank-list-container
    return $(scope).find(".rank-list-container");

  },

  // this method will be called on initialization
  initialize: function(el){

  },

  // this method will also be called on initialisation (to pass the intial state to input$...)
  // and each time when the callback is triggered via the event bound in subscribe
  getValue: function(el) {

  },

  subscribe: function(el, callback) {

  },

  receiveMessage: function(el, data) {
    $(el).find(".rank-list-title").text(data.text);
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
  initialize: function(el){

  },

  // this method will also be called on initialisation (to pass the intial state to input$...)
  // and each time when the callback is triggered via the event bound in subscribe
  getValue: function(el) {

  },

  subscribe: function(el, callback) {


  },

  receiveMessage: function(el, data) {
    $(el).find(".bucket-list-header").text(data.header);
  }

});


// register the binding so Shiny knows it exists
Shiny.inputBindings.register(bucketlistBinding);
