define [
  "msgBus"
  "marionette"
  "apps/signup/companyRegistry/CompanyRegistryController"
  ],
  (msgBus, Marionette, CompanyRegistryController) ->

    class SignupRouter extends Marionette.AppRouter
      routes:
        #FIXME: when ?name=asdf -> name = "name=asdf"
        "signup/company-registry?name=:name&email=:email": "companyRegistry"
        "signup/company-registry": "companyRegistry"

      companyRegistry: (name,email)->
        new CompanyRegistryController({name:name,email:email})

    msgBus.commands.setHandler "signup:start", ->
      new SignupRouter()

