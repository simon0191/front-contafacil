define [
  "msgBus"
  ],
  (msgBus)->
    config =
      apiUrl: "http://localhost:3000"

    msgBus.reqres.setHandler "config:get", (param)->
      return config[param]
    return
