(function () {

//////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                              //
// packages/dboyliao:errors/errors.coffee.js                                                    //
//                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////
                                                                                                //
__coffeescriptShare = typeof __coffeescriptShare === 'object' ? __coffeescriptShare : {}; var share = __coffeescriptShare;
           

Errors = {
  collection: new Mongo.Collection(null),
  "throw": function(message) {
    return Errors.collection.insert({
      message: message,
      seen: false
    });
  }
};
//////////////////////////////////////////////////////////////////////////////////////////////////

}).call(this);






(function () {

//////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                              //
// packages/dboyliao:errors/errors_list.jade.js                                                 //
//                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////
                                                                                                //
                                                                                                // 1
Template.__checkName("meteorErrors");                                                           // 2
Template["meteorErrors"] = new Template("Template.meteorErrors", (function() {                  // 3
  var view = this;                                                                              // 4
  return HTML.DIV({                                                                             // 5
    "class": "errors"                                                                           // 6
  }, Blaze.Each(function() {                                                                    // 7
    return Spacebars.call(view.lookup("errors"));                                               // 8
  }, function() {                                                                               // 9
    return Spacebars.include(view.lookupTemplate("error"));                                     // 10
  }));                                                                                          // 11
}));                                                                                            // 12
                                                                                                // 13
Template.__checkName("meteorError");                                                            // 14
Template["meteorError"] = new Template("Template.meteorError", (function() {                    // 15
  var view = this;                                                                              // 16
  return HTML.DIV({                                                                             // 17
    "class": [ "alert", " ", "alert-danger" ],                                                  // 18
    role: "alert"                                                                               // 19
  }, Blaze.View(function() {                                                                    // 20
    return Spacebars.mustache(view.lookup("message"));                                          // 21
  }), HTML.Raw('\n<button class="close" type="button" data-dismiss="alert">&times;</button>')); // 22
}));                                                                                            // 23
                                                                                                // 24
//////////////////////////////////////////////////////////////////////////////////////////////////

}).call(this);






(function () {

//////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                              //
// packages/dboyliao:errors/errors_list.coffee.js                                               //
//                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////
                                                                                                //
__coffeescriptShare = typeof __coffeescriptShare === 'object' ? __coffeescriptShare : {}; var share = __coffeescriptShare;
Template.meteorErrors.helpers({
  errors: function() {
    return Errors.collection.find();
  }
});

Template.meteorError.rendered = function() {
  var error;
  error = this.data;
  return Meteor.setTimeout(function() {
    return Errors.collection.remove(error._id);
  }, 3000);
};
//////////////////////////////////////////////////////////////////////////////////////////////////

}).call(this);
