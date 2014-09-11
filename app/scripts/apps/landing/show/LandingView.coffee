define [
  "marionette"
  "msgBus"
  "templates"
  "backbone"
  ],
  (Marionette, msgBus, templates, Backbone)->

    class LandingView extends Marionette.ItemView
      template: templates["landing/show"]
      events:
        "click .signup-submit": "signupSubmit"

      signupSubmit: (event)->
        event.preventDefault()
        name = @$("#name").val()
        email = @$("#email").val()
        companyRegistryUrl = [
          "signup/company-registry"
          "?name=#{encodeURIComponent(name)}"
          "&email=#{encodeURIComponent(email)}"
          ].join("")
        Backbone.history.navigate(companyRegistryUrl,trigger: true)


    return LandingView

