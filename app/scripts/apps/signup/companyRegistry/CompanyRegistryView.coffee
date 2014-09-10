define [
  "marionette"
  "msgBus"
  "templates"
  ],
  (Marionette, msgBus, templates)->

    class CompanyRegistryView extends Marionette.ItemView
      template: templates["signup/companyRegistry"]

    return CompanyRegistryView

