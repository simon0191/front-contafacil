define [
  "backbone"
  "marionette"
  "msgBus"
  "config"
  "apps/load"
  ],
  (Backbone, Marionette, msgBus)->
    app = new Marionette.Application()

    app.addRegions
      headerRegion : "#header-region"
      mainRegion : "#main-region"
      footerRegion : "#footer-region"

    app.on "before:start", ()->
      msgBus.reqres.setHandler "regions:header", ->
        return app.headerRegion

      msgBus.reqres.setHandler "regions:footer", ->
        return app.footerRegion

      msgBus.reqres.setHandler "regions:main", ->
        return app.mainRegion

      msgBus.commands.execute "landing:start"
      msgBus.commands.execute "signup:start"
      return

    app.on "start", ()->
      Backbone.history.start()

      if Backbone.history.fragment is ""
        Backbone.history.navigate("landing", trigger: true)

    return app
