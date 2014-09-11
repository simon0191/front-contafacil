define [
  "backbone"
  "msgBus"
  ],
  (Backbone, msgBus)->
    class Company extends Backbone.Model
      url: ()->
        apiUrl = msgBus.reqres.request("config:get","apiUrl")
        return "#{apiUrl}/companies"

    return Company