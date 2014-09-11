define [
  "backbone"
  "msgBus"
  ],
  (Backbone,msgBus)->
    class AuthToken extends Backbone.Model
      url: ()->
        apiUrl = msgBus.reqres.request("config:get","apiUrl")
        return "#{apiUrl}/users/sign_in"

    return AuthToken