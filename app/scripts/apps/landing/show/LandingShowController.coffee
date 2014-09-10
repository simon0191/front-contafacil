define [
  "marionette"
  "msgBus"
  "apps/landing/show/LandingView"
  ],
  (Marionette,msgBus,LandingView)->
    class LandingShowController extends Marionette.Controller
      initialize: ()->
        @region = msgBus.reqres.request "regions:main"
        landingView = new LandingView()
        @region.show(landingView)

    return LandingShowController
