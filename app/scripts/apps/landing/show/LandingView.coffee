define [
  "marionette"
  "msgBus"
  "templates"
  ],
  (Marionette, msgBus, templates)->

    class LandingView extends Marionette.ItemView
      template: templates["landing/show"]

    return LandingView

