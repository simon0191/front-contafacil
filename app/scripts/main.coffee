require.config

  baseUrl: "scripts"
  paths:
    jquery: "../bower_components/jquery/dist/jquery"
    bootstrap: "../bower_components/bootstrap/dist/js/bootstrap"
    backbone: "../bower_components/backbone/backbone"
    "backbone.wreqr": "../bower_components/backbone.wreqr/lib/backbone.wreqr"
    underscore: "../bower_components/underscore/underscore"
    marionette: "../bower_components/marionette/lib/backbone.marionette"

  shim:
    backbone:
      deps: ["underscore", "jquery", "underscore"]

    bootstrap:
      deps: ["jquery","underscore"]

    marionette:
      deps: ["backbone"]


require [
  "app"
  "jquery"
  ],
  (app, $)->
    $(document).ready ()->
      app.start()
