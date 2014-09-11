define [
  "marionette"
  "msgBus"
  "templates"
  "entities/User"
  "entities/Company"
  ],
  (Marionette, msgBus, templates, User, Company)->

    class CompanyRegistryView extends Marionette.ItemView
      template: templates["signup/companyRegistry"]

      initialize: (options)->
        @user = options.user || new User()
        @company = options.company || new Company()

      serializeData: ()->
        return {
          user: @user.toJSON()
          company: @company.toJSON()
        }

      events:
        "click .registry-next-step-btn": "signUp"

      signUp: (event)->
        event.preventDefault()
        @user.set
          "name": @$("#user-name").val()
          "email": @$("#user-email").val()
        @company.set
          "name": @$("#company-name").val()
          #Yes, the email of the user
          "email": @$("#user-email").val()
          "nit": @$("#company-nit").val()
          "address": @$("#company-address").val()
          "phone": @$("#company-phone").val()

        @company.save({},{
          success: (resp)->
            @user.save({company_id:2})
        })


        return

    return CompanyRegistryView

