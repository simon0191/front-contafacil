define [
  "marionette"
  "msgBus"
  "apps/signup/companyRegistry/CompanyRegistryView"
  ],
  (Marionette,msgBus,CompanyRegistryView)->

    class CompanyRegistryController extends Marionette.Controller
      initialize: ()->
        @region = msgBus.reqres.request "regions:main"
        companyRegistryView = new CompanyRegistryView()
        @region.show(companyRegistryView)

    return CompanyRegistryController