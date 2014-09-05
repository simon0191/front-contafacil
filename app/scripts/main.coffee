require.config

  baseUrl: "scripts"
  paths:
    jquery: "../bower_components/jquery/dist/jquery"
    bootstrap: "../bower_components/bootstrap/dist/js/bootstrap"
    backbone: "../bower_components/backbone/backbone"
    underscore: "../bower_components/underscore/underscore"

  shim:
    backbone:
      deps: ["underscore", "jquery"]
      exports: "Backbone"

    underscore:
      exports: "_"

    bootstrap:
      deps: ["jquery","underscore"]


require(["App","jquery","underscore","backbone","bootstrap"], (App, $,_, Backbone, bootstrap)->
  "use strict"
  $(document).ready ()->
    console.log("Yaju :D");
    window.app = new App({$view:$("#app")});
)
