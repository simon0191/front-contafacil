define [
  "msgBus"
  "marionette"
  "apps/signup/companyRegistry/CompanyRegistryController"
  ],
  (msgBus, Marionette, CompanyRegistryController) ->

    class SignupRouter extends Marionette.AppRouter
      routes:
        "signup/company-registry": "companyRegistry"

      companyRegistry: ()->
        new CompanyRegistryController()

    msgBus.commands.setHandler "signup:start", ->
      new SignupRouter()

