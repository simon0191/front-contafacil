define [
  "backbone"
  "msgBus"
  ],
  (Backbone,msgBus)->
    class User extends Backbone.Model
      url: ()->
        apiUrl = msgBus.reqres.request("config:get","apiUrl")
        return "#{apiUrl}/users"

    return User