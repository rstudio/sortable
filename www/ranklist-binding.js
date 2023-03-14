
// this object that tells Shiny how to identify instances of our component and how to interact with them
var ranklistBinding = new Shiny.InputBinding();

// add some methods to our binding object
$.extend(ranklistBinding, {

  find: function(scope) {

    // find all instances of class FrissSwitch
    return $(scope).find(".rank-list-container");

  },

  // this method will be called on initialisation
  initialize: function(el){

  },

  // this method will also be called on initialisation (to pass the intial state to input$...)
  // and each time when the callback is triggered via the event bound in subscribe
  getValue: function(el) {

  },

  // we want to subscribe to the switchChange event
  // see http://bootstrapswitch.com/events.html
  subscribe: function(el, callback) {


  },

  receiveMessage: function(el, data) {
    $(el).find(".rank-list-title").text(data.text);
  }

});


// register the binding so Shiny knows it exists
Shiny.inputBindings.register(ranklistBinding);
