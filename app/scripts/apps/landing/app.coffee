define [
  "msgBus"
  "marionette"
  "apps/landing/show/LandingShowController"
  ],
  (msgBus, Marionette, LandingShowController) ->

    class LandingRouter extends Marionette.AppRouter
      routes:
        "landing": "landing"

      landing: ()->
        new LandingShowController()

    msgBus.commands.setHandler "landing:start", ->
      new LandingRouter()

