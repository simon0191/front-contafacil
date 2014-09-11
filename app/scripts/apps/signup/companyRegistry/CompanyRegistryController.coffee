define [
  "marionette"
  "msgBus"
  "apps/signup/companyRegistry/CompanyRegistryView"
  "entities/User"
  ],
  (Marionette,msgBus,CompanyRegistryView, User)->

    class CompanyRegistryController extends Marionette.Controller
      initialize: (options)->

        user = new User
          name: options.name || ""
          email: options.email || ""

        @region = msgBus.reqres.request "regions:main"
        companyRegistryView = new CompanyRegistryView(
          user: user
        )
        @region.show(companyRegistryView)

    return CompanyRegistryController